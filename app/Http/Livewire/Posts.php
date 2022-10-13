<?php

namespace App\Http\Livewire;

use App\Helper\MySlugHelper;
use App\Models\Post;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;


class Posts extends Component
{

    use WithPagination , WithFileUploads ,  LivewireAlert;


    public $modalFormVisible = false;
    public $title;
    public $slug;
    public $body;
    public $image;  // form DB
    public $image_binging;  // image that will binding
    public $image_new_name; // image new name when uploading
    public $modelID  ;
    public $modalDeleteConfirm ;



    public function showCreateModal() {

        $this->resetCreateForm();
        $this->modalFormVisible = true;
        $this->modalDeleteConfirm = false;
        $this->resetValidation();


    }


    public function showUpdateModal($id)
    {

        $this->resetCreateForm();

        $this->loadData($id) ;

        $this->modalFormVisible = true;
        $this->modalDeleteConfirm = false;

        $this->emit('postEdit') ;  // this event used to show texteditor data on edit


    }

    public function loadData($id)
    {


        $post = Post::whereId($id)->whereUserId(auth()->id())->first();
        if ($post) {
            $this->modelID = $id ;
            $this->title = $post->title ;
            $this->body =$post->body  ;
            $this->slug = $post->slug ;
            $this->image = $post->image ;
        }

    }

    public function get_posts()
    {

      return  Post::orderBy('id','Desc')->paginate(5) ;
    }

    public function render()
    {


        return view('livewire.posts',[
            'posts' => $this->get_posts()
        ]);
    }


    // validation rules
    protected function rules()
    {
        return [
                'title' => 'required',
                'body' => 'required',
                'image_binging' => [Rule::requiredIf(!$this->modelID) ,'max:1024'], // required only on create
                'slug' => ['required', Rule::unique('posts', 'slug')->ignore($this->modelID)] // ignore slug unique on update
        ];
    }


    // make hooks on title to update slug
    public function updatedTitle($value)
    {
        $this->slug = MySlugHelper::slug($value );

    }




    public function resetCreateForm()
    {
        $this->modelID = null ;
        $this->title = null ;
        $this->body = null ;
        $this->slug = null ;
        $this->image = null ;
        $this->image_binging = null ;
        $this->emit('postNewCreate') ;

    }




    public function storePost()
    {

        $this->validate() ;  // this validate will look on   protected function rules() to make validation

        $data = [] ;
        $data['title'] = $this->title  ;
        $data['body'] = $this->body  ;
        $data['slug'] = $this->slug;



        // image upload
        if($this->image_binging !="") {
            $this->image_new_name =    md5(  microtime() ) .".".$this->image_binging->extension();
            $this->image_binging->storeAs('/', $this->image_new_name , 'images')  ; // temporary image bind to $this->>image   -- here before save
            $data['image'] =    $this->image_new_name  ;

        }



        auth()->user()->posts()->create( $data) ;


        $this->resetCreateForm();

        $this->modalFormVisible = false;


        // basic
         //$this->alert('success', 'Basic Alert');


        $this->alert('success', 'Post added successful!', [
            'position'  =>  'top-end',
            'timer'  =>  3000,
            'toast'  =>  true,
            'text'  =>  "congrate",
            'showCancelButton'  =>  false,
            'showConfirmButton'  =>  false
        ]);





    }


    public function updatePost()
    {



        $this->validate() ;  // this validate will look on   protected function rules() to make validation

        $data = [] ;


        $post = Post::whereId($this->modelID)->whereUserId(auth()->id())->first();
        if($post){
            $data['title'] = $this->title  ;
            $data['body'] = $this->body  ;
            $data['slug'] = $this->slug;

            //image
            // image upload
            if($this->image_binging !="") {

                // remove old image
                if(File::exists(   asset('images/'.$post->image)  )){
                    unlink( asset('images/'.$post->image)   ) ;
                }


                 // handle new image
                $this->image_new_name =    md5(  microtime() ) .".".$this->image_binging->extension();
                $this->image_binging->storeAs('/', $this->image_new_name , 'images')  ; // temporary image bind to $this->>image   -- here before save
                $data['image'] =    $this->image_new_name  ;

            }

        }

        $post->update($data);


        $this->resetCreateForm();

        $this->modalFormVisible = false;


        // basic
        //$this->alert('success', 'Basic Alert');


        $this->alert('success', 'Post updated successful!', [
            'position'  =>  'top-end',
            'timer'  =>  3000,
            'toast'  =>  true,
            'text'  =>  "Update",
            'showCancelButton'  =>  false,
            'showConfirmButton'  =>  false
        ]);





    }



    public function showDeleteModal($id)
    {
        $this->modelID = $id;
        $this->modalDeleteConfirm = true;
    }


    public function deletePost($id)
    {


        $this->modalDeleteConfirm = false;

        $post = Post::whereId($this->modelID)->whereUserId(auth()->id())->first();
        if($post){


            if(File::exists('images/'.$post->image)  ){
                unlink( 'images/'.$post->image  ) ;
            }
            $post->delete();

            $this->alert('success', 'Post deleted successful!', [
                'position'  =>  'top-end',
                'timer'  =>  3000,
                'toast'  =>  true,
                'text'  =>  "Delete",
                'showCancelButton'  =>  false,
                'showConfirmButton'  =>  false
            ]);



        }else{
            $this->alert('warning', 'this post not belong to you', [
                'position'  =>  'top-end',
                'timer'  =>  3000,
                'toast'  =>  true,
                'text'  =>  "Delete",
                'showCancelButton'  =>  false,
                'showConfirmButton'  =>  false
            ]);
        }


        $this->resetPage();   // to go to page 1 after delete from other pages like page 2 , 3 , 4 for example

/*
 =>resetPage() :
 Resetting Pagination After Filtering Data :
https://laravel-livewire.com/docs/2.x/pagination#resetting-pagination


 */



    }


}

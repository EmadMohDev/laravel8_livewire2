<?php

namespace App\Http\Livewire;

use App\Models\Post;
use Livewire\Component;

class ShowPost extends Component
{

    public $post;
    public $slug;
    public $title;
    public $body;
    public $image;

    public function mount($slug)
    {
        $this->getPost($slug) ;
    }


    public function getPost($slug)
    {

        $this->post = Post::where('slug', $slug)->first();
        $this->slug = $this->post->slug;
        $this->title = $this->post->title;
        $this->body = $this->post->body;
        $this->image = $this->post->image;


    }


    public function render()
    {
        return view('livewire.show-post')->layout('layouts.app');
    }




    public function returnToPosts()
    {
        return redirect()->route('posts');
    }
}

<div>

    <div class="flex items-center justify-end py-4 text-right">
        <x-jet-button wire:click='showCreateModal' >
            {{__('Create Post')}}
        </x-jet-button>
    </div>


    <table class="w-full divide-y divide-gray-200">
        <thead>
        <tr>
            <th class="px-6 py-3 border-b-2 border-gray-200 text-left text-blue-500 tracking-wider">ID</th>
            <th class="px-6 py-3 border-b-2 border-gray-200 text-left text-blue-500 tracking-wider">Image</th>
            <th class="px-6 py-3 border-b-2 border-gray-200 text-left text-blue-500 tracking-wider">Title</th>
            <th class="px-6 py-3 border-b-2 border-gray-200 text-left text-blue-500 tracking-wider">Action</th>
        </tr>
        </thead>


        <tbody>
        @forelse($posts as $post)
            <tr>
                <td class="px-6 py-4 border-b-2 border-gray-200">{{$post->id}}</td>
                <td class="px-6 py-4 border-b-2 border-gray-200"><img src="{{asset('images/'.$post->image)}}"
                                                                      alt="{{$post->title}}" width="100px"></td>
                <td class="px-6 py-4 border-b-2 border-gray-200">
                    <a href="{{route('show-post', $post->slug)}}"   class="text-gray-900 hover:text-indigo-500"    > {{$post->title}}  </a>

                </td>
                <td class="px-6 py-4 border-b-2 border-gray-200">

                    <div class="flex items-center justify-end py-4 text-right">
                        <x-jet-button class="mr-2" wire:click="showUpdateModal({{$post->id}})">
                            {{__('Edit')}}
                        </x-jet-button>

                        <x-jet-danger-button wire:click="showDeleteModal({{$post->id}})">
                            {{__('Delete')}}
                        </x-jet-danger-button>
                    </div>


                </td>
            </tr>

        @empty
            <tr>
                <td colspan="4" class="px-6 py-4 border-b-2 border-gray-200"> No Posts Found</td>
            </tr>
        @endforelse
        </tbody>
    </table>

    <div class="pt-4">
        {{$posts->links()}}
    </div>



    <x-jet-dialog-modal wire:model="modalFormVisible">

        <x-slot name="title">
            {{  $modelID ?  __('Update post') :  __('Create post')    }}
        </x-slot>


        <x-slot name="content">


            <div class="mt-4">
                <x-jet-label for="title" value="{{__('Title')}}"/>

                <x-jet-input type="text" wire:model="title" class="w-full block mt-1"></x-jet-input>
                @error('title') <span class="text-red-600 text-sm font-extrabold">{{$message}}</span>@enderror

            </div>



            <div class="mt-4">
                <x-jet-label for="slug" value="{{__('Slug')}}"/>

                <div class="flex rounded shadow-sm">

                  <span class="inline-flex items-center
                  px-3
                   rounded-l-md
                   border broder-r-0 border-gray-300  bg-gray-50
                   text-gray-500 text-sm ">{{config('app.url').'/'}}</span>

                    <input type="text" wire:model="slug" class="w-full r rounded-r-md" placeholder="url slug"></input>
                    @error('slug') <span class="text-red-600 text-sm block w-full">{{$message}}</span>@enderror
                </div>


            </div>





            <div class="mt-4">
                <x-jet-label for="body" value="{{ __('Content') }}"></x-jet-label>

                <div wire:ignore >
                    <div id="editor" class="block mt-1 w-full">
                        {!! $body !!}
                    </div>
                </div>

                <textarea id="body" class="hidden body-content" wire:model.debounce.2000ms="body">
                    {!! $body !!}
                </textarea>
                @error('body')<span class="text-red-900 text-sm font-extrabold">{{ $message }}</span>@enderror
            </div>


            {{--original image that we get from DB --}}
            @if(  $image != "")
                <img src="{{asset('images/'.$image)}}" alt="" width="200">

            @endif



            {{-- image binging and preview --}}
            <div class="flex py-4">

                <div class="items-center text-sm text-gray-500 border border-gray-300 bg-gray-50 rounded  shadow-sm">

                    @if(  $image_binging != "")
                        <img src="{{$image_binging->temporaryUrl()}}" alt="" width="200">

                    @endif

                </div>

            </div>


            {{--image input file --}}
            <div class="mt-4">
                <x-jet-label for="image_binging" value="{{__('Image')}}"/>

                <input type="file" id="image_binging" wire:model='image_binging'>

                @error('image_binging') <span class="text-red-600 text-sm">{{$message}}</span>@enderror

            </div>




        </x-slot>


        <x-slot name="footer">


            @if($modelID )
            <x-jet-button  wire:click="updatePost" >
                {{ __('Update post') }}
            </x-jet-button>

            @else

                <x-jet-button  wire:click="storePost" >
                    {{ __('Create post') }}
                </x-jet-button>

            @endif

                <x-jet-secondary-button class="ml-2" wire:click="$toggle('modalFormVisible')">
                {{ __('Cancel') }}
            </x-jet-secondary-button>


        </x-slot>


    </x-jet-dialog-modal>



{{--delete model to confirm delete or cancel--}}
    @if($modalDeleteConfirm && $modelID)
    <x-jet-dialog-modal wire:model="modalDeleteConfirm">

        <x-slot name="title">
            {{   __('Delete Post')    }}
        </x-slot>


        <x-slot name="content">

{{ __('Are you sure you want to delete this post?') }}

        </x-slot>


        <x-slot name="footer">

                <x-jet-danger-button  wire:click="deletePost({{$modelID}})" >
                    {{ __('Delete Post') }}
                </x-jet-danger-button>


            <x-jet-secondary-button class="ml-2" wire:click="$toggle('modalDeleteConfirm')">
                {{ __('Cancel') }}
            </x-jet-secondary-button>


        </x-slot>


    </x-jet-dialog-modal>
@endif
</div>



@push('scripts')
    <script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
    <script>

        window.onload = function () {



            // to reset file data on create new post
            Livewire.on('postNewCreate', function(){
                document.querySelector( '#image_binging' ).value = "" ;

            }) ;



            if (document.querySelector('#editor')) {

                ClassicEditor.create( document.querySelector( '#editor' ) )
                    .then( editor => {

                        editor.model.document.on( 'change:data', () => {
                            console.log( 'The data has changed!' );

                            document.querySelector('#editor').value = editor.getData();
                        @this.set('body', document.querySelector('#editor').value);

                        } );


                        // to show body data on edit post
                        Livewire.on('postEdit', function(){
                            editor.setData( document.querySelector('#body').value) ;   // set editor value with textarea hidden value

                        }) ;


                        // to reset editor data on create new post
                        Livewire.on('postNewCreate', function(){
                            editor.setData( "") ;   // set editor value with textarea hidden value

                        }) ;





                    } )
                    .catch( error => {
                        console.log( error );
                    } );


            }


        }



    </script>
@endpush

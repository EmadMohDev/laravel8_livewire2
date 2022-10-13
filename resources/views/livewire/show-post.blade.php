<x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        {{ __('Show Post') }}
    </h2>
</x-slot>





<div class="py-12">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">

            <div class="text-right py-4">
                <x-jet-button class="mr-2" wire:click="returnToPosts">
                    {{__('List Posts')}}
                </x-jet-button>
            </div>




            <h1 class="text-center font-extrabold text-2xl py-5">
                {{ $title }}
            </h1>

            <div class="py-5">
                <img src="{{asset('images/'.$image)}}" alt="{{$title}}" class="mx-auto">
            </div>


            <div class="py-5 text-center ">
            {!! $body !!}
            </div>

        </div>
    </div>
</div>



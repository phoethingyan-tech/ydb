@extends('layouts.front')
@section('content')

<!-- @php
    var_dump($pdf_posts);
@endphp -->
    <!-- pdf list -->
    <div class="container mt-4">
        <div class="row g-3">
            <!-- item -->
            @foreach($pdf_posts as $pdf_post)
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card h-100 bg-color-card shadow rounded-3 card-hover d-flex card-sm-horizontal">
                    <img class="card-img-top rounded-top-3" src="{{$pdf_post->photo}}" alt="Card image cap">
                    <div class="card-body text-center p-0 m-0">
                        <h5 class="card-title fw-bolder m-0 mt-2">{{$pdf_post->created_at->format('d-m-y')}}</h5>
                        <p class="my-2">{{$pdf_post->title}}</p>
                        <a href="{{ route('pdf_download', $pdf_post->id) }}" class="btn btn-primary mb-2 ms-2 me-2">Download</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        <div class="my-3">
            {{$pdf_posts->links()}}
        </div>
        
  </div>
@endsection

  
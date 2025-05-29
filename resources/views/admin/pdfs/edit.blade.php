@extends('layouts.admin')
@section('content')
<div class="container-fluid px-4">
    <div class="my-3">
        <h1 class="mt-4 d-inline">Edit Post</h1>
        <a href="{{route('backend.pdfs.index')}}" class="btn btn-danger float-end">Cancel</a>
    </div>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="{{route('backend.dashboard')}}">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="{{route('backend.pdfs.index')}}">Posts</a></li>
        <li class="breadcrumb-item active">Edit Post</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Edit Post
        </div>

        <div class="card-body">
            <form action="{{route('backend.pdfs.update',$pdf->id)}}" method="post" enctype="multipart/form-data">
                @csrf
                @method('put')
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" id="title" value = "{{$pdf->title}}">
                
                    @error('title')
                        <div class="invalid-feedback">The title field is required.</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="photo-tab" data-bs-toggle="tab" data-bs-target="#photo-tab-pane" type="button" role="tab" aria-controls="photo-tab-pane" aria-selected="true">Photo</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="new_photo-tab" data-bs-toggle="tab" data-bs-target="#new_photo-tab-pane" type="button" role="tab" aria-controls="new_photo-tab-pane" aria-selected="false">New Photo</button>
                        </li>                       
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="photo-tab-pane" role="tabpanel" aria-labelledby="photo-tab" tabindex="0">
                            <img src="{{$pdf->photo}}" class="my-3" width="100" height="150" alt="Previous upload">
                            <input type="hidden" name = "old_photo" id="" value = "{{$pdf->photo}}">
                        </div>
                        <div class="tab-pane fade" id="new_photo-tab-pane" role="tabpanel" aria-labelledby="new_photo-tab" tabindex="0">
                            <input type="file" accept="image/*" class="form-control my-3 @error('photo') is-invalid @enderror" name="photo" id="photo">                           
                        </div>                     
                    </div>
                                   
                    @error('photo')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pdf-tab" data-bs-toggle="tab" data-bs-target="#pdf-tab-pane" type="button" role="tab" aria-controls="pdf-tab-pane" aria-selected="true">PDF</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="new_pdf-tab" data-bs-toggle="tab" data-bs-target="#new_pdf-tab-pane" type="button" role="tab" aria-controls="new_pdf-tab-pane" aria-selected="false">New PDF</button>
                        </li>                       
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="pdf-tab-pane" role="tabpanel" aria-labelledby="pdf-tab" tabindex="0">
                            <h5 class="my-3 text-danger">{{basename($pdf->pdf_file)}}</h5>
                            <input type="hidden" name = "old_pdf" id="" value = "{{$pdf->pdf_file}}">
                        </div>
                        <div class="tab-pane fade" id="new_pdf-tab-pane" role="tabpanel" aria-labelledby="new_pdf-tab" tabindex="0">
                            <input class="form-control my-3 @error('pdf_file') is-invalid @enderror" type="file" name="pdf_file" id="pdf_file">
                        </div>                       
                    </div>
                    

                    @error('pdf_file')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>                

                <input type="hidden" name="user_id" value="2">
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-warning mb-3">Update</button>
                </div>
            </form>
        
    </div>
@endsection
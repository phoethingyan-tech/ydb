@extends('layouts.admin')
@section('content')
<div class="container-fluid px-4">
    <div class="my-3">
        <h1 class="mt-4 d-inline">Create Post</h1>
        <a href="{{route('backend.pdfs.index')}}" class="btn btn-danger float-end">Cancel</a>
    </div>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="{{route('backend.dashboard')}}">Dashboard</a></li>
        <li class="breadcrumb-item active">Post Create</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Post Create
        </div>

        <div class="card-body">
            <form action="{{route('backend.pdfs.store')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" id="title" value = "{{old('title')}}">
                
                    @error('title')
                        <div class="invalid-feedback">The title field is required.</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="photo" class="form-label">Photo</label>
                    <input class="form-control @error('photo') is-invalid @enderror" type="file" name="photo" id="photo">
                
                    @error('photo')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="pdf_file" class="form-label">PDF File</label>
                    <input class="form-control @error('pdf_file') is-invalid @enderror" type="file" name="pdf_file" id="pdf_file">

                    @error('pdf_file')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>                

                <!-- <div class="mb-3">
                    <label for="user_id" class="form-label">User</label>
                    <select id="inputState" class="form-select @error('user_id') is-invalid @enderror" name="user_id" id="user_id">
                        <option value="" selected>Choose User</option>
                        @foreach($users as $user)
                            <option value="{{$user->id}}"{{old('user_id') == $user->id ? 'selected':''}}>
                                {{$user->name}}</option>
                        @endforeach
                    </select>

                    @error('photo')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div> -->
                <input type="hidden" name="user_id" value="1">
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary mb-3">Post</button>
                </div>
            </form>
        
    </div>
@endsection
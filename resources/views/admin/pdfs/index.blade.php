@extends('layouts.admin')
@section('content')
    <div class="container-fluid px-4">
        <div class="my-3">
            <h1 class="mt-4 d-inline">PDF Posts</h1>
            <a href="{{route('backend.pdfs.create')}}" class="btn btn-primary float-end">Create Post</a>
        </div>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="{{route('backend.dashboard')}}">Dashboard</a></li>
            <li class="breadcrumb-item active">PDF Posts</li>
        </ol>
        
        
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                PDF Posts List
            </div>
            <div class="card-body">
                <table class="table table-border">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>Photo</th>
                            <th>Post Date</th>
                            <th>User</th>
                            <th>Action</th>
                        </tr>
                    </thead>                    
                    <tbody>
                        @php
                            $i=1;
                        @endphp
                        @foreach($pdfs as $pdf)
                        <tr>
                            <td>{{$i++}}</td>
                            <td>{{$pdf->title}}</td>
                            <td><img src="{{$pdf->photo}}" width="70" height="100" alt=""></td>
                            <td>{{$pdf->created_at->format('d-m-y')}}</td>
                            <td>{{$pdf->user->name ?? 'Unknown User'}}</td>
                            <td>
                                <a href="{{route('backend.pdfs.edit',$pdf->id)}}" class="btn btn-sm btn-warning">Edit</a>
                                <button type="button" class="btn btn-sm btn-danger delete" data-id="{{$pdf->id}}">Delete</button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>Photo</th>
                            <th>Post Date</th>
                            <th>User</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>                    
                </table>
                {{$pdfs->links()}}
            </div>
        </div>
    </div>

    
    <!-- DeleteModal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header bg-danger text-light">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Are you sure delete!</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <form action="" id="deleteform" method="post">
                    @csrf
                    @method('delete')
                    <button type="submit" class="btn btn-danger">Yes</button>
                </form>
            </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(document).ready(function() {
            $('tbody').on('click', '.delete', function(){
                // alert('hello');
                let id = $(this).data('id');
                // console.log(id);
                $('#deleteform').attr('action',`pdfs/${id}`);
                $('#deleteModal').modal('show');
            })
        })
    </script>
@endsection
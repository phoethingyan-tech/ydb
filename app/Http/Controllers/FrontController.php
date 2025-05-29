<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pdf_post;

class FrontController extends Controller
{
    public function pdf_view() {
        // $pdf_posts = Pdf_post::all();
        $pdf_posts = Pdf_post::orderBy('id', 'DESC')->paginate(8);
        // var_dump($pdf_posts);
        return view('front.pdf_view', compact('pdf_posts'));
    }

    public function download($id)
    {
        $pdf_post = Pdf_post::findOrFail($id);
        $relativePath = ltrim($pdf_post->pdf_file, '/'); // removes leading "/"
        $filePath = public_path($relativePath); // now points to public/pdf_post/pdfs/...

        if (!file_exists($filePath)) {
            abort(404, 'File not found.');
        }

        return response()->download($filePath, basename($filePath));
    }
    
}

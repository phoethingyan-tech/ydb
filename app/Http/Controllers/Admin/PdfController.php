<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pdf_post;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Carbon\Carbon;
use App\Http\Requests\PdfRequest;
use App\Http\Requests\PdfUpdateRequest;


class PdfController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        $pdfs = Pdf_post::with('user')->orderBy('id', 'DESC')->paginate(7);
        return view('admin.pdfs.index', compact('pdfs'));
    }
    /**
     * Show the form for creating a new resource.
     */
    
    public function create()
    {
        $users = User::all();
        return view('admin.pdfs.create',compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PdfRequest $request)
    {  
        $pdfs = Pdf_post::create($request->all());

        $today = Carbon::now(); // or use Carbon::createFromFormat('d-m-Y', '20-5-2025');
        $year = $today->year;
        $monthName = strtolower($today->format('F')); // 'may', 'april', etc.
        $dateString = $today->format('d-m-Y'); // '20-5-2025'

        // ================= Upload Photo =================
        if ($request->hasFile('photo')) {
            $photoDirectory = "pdf_post/photos/{$year}/{$monthName}/";
            $photoFilename = "{$dateString}.{$request->photo->extension()}";

            // Create directory if it doesn't exist
            File::makeDirectory(public_path($photoDirectory), 0777, true, true);

            $request->photo->move(public_path($photoDirectory), $photoFilename);
            $pdfs->photo = "/" . $photoDirectory . $photoFilename;
        }

        // ================= Upload PDF File =================
        if ($request->hasFile('pdf_file')) {
            $pdfDirectory = "pdf_post/pdfs/{$year}/{$monthName}/";
            $pdfFilename = "{$dateString}.{$request->pdf_file->extension()}";

            // Create directory if it doesn't exist
            File::makeDirectory(public_path($pdfDirectory), 0777, true, true);

            $request->pdf_file->move(public_path($pdfDirectory), $pdfFilename);
            $pdfs->pdf_file = "/" . $pdfDirectory . $pdfFilename;
        }

        // $pdfs->user_id=2;
        $pdfs->save();

        return redirect()->route('backend.pdfs.index');
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $pdf = Pdf_post::find($id);
        return view('admin.pdfs.edit',compact('pdf'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PdfUpdateRequest $request, string $id)
    {
        $pdf = Pdf_post::find($id);
        $pdf->update($request->all());

        $today = Carbon::now(); // or use Carbon::createFromFormat('d-m-Y', '20-5-2025');
        $year = $today->year;
        $monthName = strtolower($today->format('F')); // 'may', 'april', etc.
        $dateString = $today->format('d-m-Y'); // '20-5-2025'

        // ================= Upload Photo =================
        if ($request->hasFile('photo')) {
            $photoDirectory = "pdf_post/photos/{$year}/{$monthName}/";
            $photoFilename = "{$dateString}.{$request->photo->extension()}";

            File::makeDirectory(public_path($photoDirectory), 0777, true, true);

            $request->photo->move(public_path($photoDirectory), $photoFilename);
            $pdf->photo = "/" . $photoDirectory . $photoFilename;
        } else {
            $pdf->photo = $request->old_photo;
        }


        // ================= Upload PDF File =================
        if ($request->hasFile('pdf_file')) {
            $pdfDirectory = "pdf_post/pdfs/{$year}/{$monthName}/";
            $pdfFilename = "{$dateString}.{$request->pdf_file->extension()}";

            File::makeDirectory(public_path($pdfDirectory), 0777, true, true);

            $request->pdf_file->move(public_path($pdfDirectory), $pdfFilename);
            $pdf->pdf_file = "/" . $pdfDirectory . $pdfFilename;
        } else {
            $pdf->pdf_file = $request->old_pdf;
        }

        $pdf->save();
        return redirect()->route('backend.pdfs.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // echo "<h1>$id</h1>";
        $pdf = Pdf_post::find($id);
        $pdf->delete();
        return redirect()->route('backend.pdfs.index');
    }
}

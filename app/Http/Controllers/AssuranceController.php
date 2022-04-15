<?php

namespace App\Http\Controllers;

use App\File;
use App\Models\Actes;
use App\Models\Assurance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class AssuranceController extends Controller
{
    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function dashSuperAdminAssurances(Request $request)
    {

        $page_title = "Assurances";

        $actes = Assurance::all();

        return view('backend.superadmin.dashSuperAdminAssurance', compact('page_title', 'actes'));

    }

    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function updateAssuranceSuperAdmin(Request $request)
    {
        $ass_id = $request->input('code');
        $new_ass = Assurance::where('code_assurance', $ass_id)->first();
//        dd($new_ass);
        $filename = '';

        // Get new data
        $new_ass->code_assurance = $request->input('code');
        $new_ass->nom_assurance = $request->input('nom');
        $new_ass->tel = $request->input('tel');
        $new_ass->raison_sociale = $request->input('localistation');
        $new_ass->statut_juridique = $request->input('statt');
        $new_ass->site_web = $request->input('site');

        if ($request->file('picass') !== null) {
            $file = $request->file('picass');

            if ($request->hasFile('picass')) {
                $path = public_path('assets/img/images/assurance/');
                // foreach ($files as $file) {
                $filename = strtolower(trim($request->input('nom'))). '.' . $file->getClientOriginalExtension();

                $location = '/images/assurance/'. $filename;
                $file->move($path, $filename);
                $new_ass->logo = $location;
            }
        }

        if($new_ass->save()){
            // Redirection
            return redirect()->back()->with('success', 'Acte modifié avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de modifier cet acte !');

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function newAssuranceSuperAdmin(Request $request)
    {
        $new_ass = new Assurance();

        // Get new data
        $new_ass->code_assurance = $request->input('code');
        $new_ass->nom_assurance = $request->input('nom');
        $new_ass->tel = $request->input('tel');
        $new_ass->raison_sociale = $request->input('localistation');
        $new_ass->statut_juridique = $request->input('statt');
        $new_ass->site_web = $request->input('site');

        if ($request->file('picass') !== null) {
            $file = $request->file('picass');

            if ($request->hasFile('picass')) {
                $path = public_path('assets/img/images/assurance/');
                // foreach ($files as $file) {
                $filename = strtolower(trim($request->input('nom'))). '.' . $file->getClientOriginalExtension();

                $location = '/images/assurance/'. $filename;
                $file->move($path, $filename);
                $new_ass->logo = $location;
            }
        }

        if($new_ass->save()){
            // Redirection
            return redirect()->back()->with('success', 'Nouvel acte crée avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de créer cet acte !');

    }
}

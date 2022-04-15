<?php

namespace App\Http\Controllers;

use App\Models\Actes;
use App\Models\Assurance;
use App\Models\Etablissements;
use Illuminate\Http\Request;

class EtablissementsController extends Controller
{
    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function dashSuperAdminEtablissements(Request $request)
    {

        $page_title = "Etablissements";

        $actes = Etablissements::all();

        return view('backend.superadmin.dashSuperAdminEtablissement', compact('page_title', 'actes'));

    }

    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function updateEtablissementSuperAdmin(Request $request)
    {
        $ass_id = $request->input('code');
        $new_ass = Etablissements::where('code_etablissement', $ass_id)->first();
//        dd($request);
        $filename = '';

        // Get new data
        $new_ass->code_etablissement = $request->input('code');
        $new_ass->nom_etablissement = $request->input('nom');
        $new_ass->tel = $request->input('tel');
        $new_ass->raison_sociale = $request->input('localistation');
        $new_ass->statut_juridique = $request->input('statt');
        $new_ass->site_web = $request->input('site');
        $new_ass->bp = $request->input('bp');

        if ($request->file('picass') !== null) {
            $file = $request->file('picass');

            if ($request->hasFile('picass')) {
                $path = public_path('assets/img/assets/images/etablissement/hopital');
                // foreach ($files as $file) {
                $filename = strtolower(trim($request->input('code'))). '.' . $file->getClientOriginalExtension();
                $location = '/assets/images/etablissement/hopital/'. $filename;
                $file->move($path, $filename);
//                dd($location);
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
        $new_ass = new Etablissements();

        // Get new data
        $new_ass->code_etablissement = $request->input('code');
        $new_ass->nom_etablissement = $request->input('nom');
        $new_ass->tel = $request->input('tel');
        $new_ass->raison_sociale = $request->input('localistation');
        $new_ass->statut_juridique = $request->input('statt');
        $new_ass->site_web = $request->input('site');
        $new_ass->bp = $request->input('bp');

        if ($request->file('picass') !== null) {
            $file = $request->file('picass');

            if ($request->hasFile('picass')) {
                $path = public_path('assets/img/assets/images/etablissement/hopital');
                // foreach ($files as $file) {
                $filename = strtolower(trim($request->input('code'))). '.' . $file->getClientOriginalExtension();
                $location = '/assets/images/etablissement/hopital/'. $filename;
                $file->move($path, $filename);
//                dd($location);
                $new_ass->logo = $location;
            }
        }

       if($new_ass->save()){
            // Redirection
            return redirect()->back()->with('success', 'Nouvel Etablissement crée avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de créer cet Etablissement !');

    }
}

@extends('layouts.layout_superadmin')

@section('page-content')

	<!--User Dashboard-->

        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Gestion des Medicaments</h5>

              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">Listing des Medicaments</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Ajouter Medicament</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabContent">
                <div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">
                  <table class="table datatable">
	                <thead>
	                  <tr>

	                    <th scope="col" class="align-middle">Numero</th>
						<th scope="col" class="align-middle">Nom Medicament</th>
						<th scope="col" class="align-middle">DCI</th>
						<th scope="col" class="align-middle">Actions</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  @if(count($actes) != 0)
                    	@foreach($actes as $acte)
                        <tr>
							<td class="fw-bolder align-middle">{{ $acte->id }}</td>
							<td class="align-middle fw-bolder">{{ $acte->nom_commercial }}</td>
							<td class="align-middle text-sm-center" style="font-size: 12px">{{ $acte->dci }}</td>
							<td class="text-center">
                                <button type="button" class="btn p-0 px-1 btn-outline-success" data-bs-toggle="modal" data-bs-target="#medoc{{ $acte->id }}">
                                    <i class="bi bi-eye-fill pe-none"></i>
                                </button>
                                <button type="button" class="btn p-0 px-1 btn-outline-warning" data-bs-toggle="modal" data-bs-target="#edit{{ $acte->id }}">
                                    <i class="bi bi-pencil-fill"></i>
                                </button>
								<a href="{{ URL::to('dashboard/root/edit-acte') }}/{{ $acte->id }}" class="btn p-0 px-1 btn-outline-danger"><i class="bi bi-trash-fill"></i></a>
							</td>
                            <!-- Modal SEE -->
                            <div class="modal fade" id="medoc{{ $acte->id }}" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title fw-bolder" id="">Medicament #{{ $acte->id }}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Nom Medicament</label>
                                                    <input type="text" class="form-control mb-1" value="{{ $acte->nom_commercial }}" disabled>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">DCI</label>
                                                    <input type="text" class="form-control mb-1" value="{{ $acte->dci }}" disabled>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Taux Remise</label>
                                                    <input type="text" class="form-control mb-1" value="{{ $acte->taux_rem }}" disabled>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Posologie</label>
                                                    <textarea class="form-control" style="height: 50px" value="{{ $acte->posologie }}" disabled></textarea>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Effets Indesirables</label>
                                                    <textarea class="form-control" style="height: 50px" value="{{ $acte->effet_indesir }}" disabled></textarea>
                                                </div>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Indication</label>
                                                    <textarea class="form-control" style="height: 50px" value="{{ $acte->indication }}" disabled></textarea>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Contre Indication</label>
                                                    <textarea class="form-control" style="height: 50px" value="{{ $acte->contre_indication }}" disabled></textarea>
                                                </div>
                                                <div class="col-md-12 d-flex flex-column align-content-between">
                                                    <label class="form-label fw-bolder">Grossesse Allaitement</label>
                                                    <textarea class="form-control" style="height: 50px" value="{{ $acte->grossesse_allait }}" disabled></textarea>
                                                </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Edit -->
                            <div class="modal fade" id="edit{{ $acte->id }}" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title fw-bolder" id="">Edit Medicament #{{ $acte->id }}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" enctype="multipart/form-data" action="{{ route('updateMedicamentSuperAdmin') }}">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-md-12 d-flex flex-column align-content-between d-none">
                                                        <label class="form-label fw-bolder">Nom Medicament</label>
                                                        <input type="text" class="form-control mb-1" value="{{ $acte->id }}" name="id">
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Nom Medicament</label>
                                                        <input type="text" class="form-control mb-1" value="{{ $acte->nom_commercial }}" name="nm">
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">DCI</label>
                                                        <input type="text" class="form-control mb-1" value="{{ $acte->dci }}" name="dci">
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Taux Remise</label>
                                                        <input type="text" class="form-control mb-1" value="{{ $acte->taux_rem }}" name="tr">
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Posologie</label>
                                                        <textarea class="form-control" style="height: 50px" value="{{ $acte->posologie }}" name="poso"></textarea>
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Effets Indesirables</label>
                                                        <textarea class="form-control" style="height: 50px" value="{{ $acte->effet_indesir }}" name="effet"></textarea>
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Indication</label>
                                                        <textarea class="form-control" style="height: 50px" value="{{ $acte->indication }}" name="indi"></textarea>
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Contre Indication</label>
                                                        <textarea class="form-control" style="height: 50px" value="{{ $acte->contre_indication }}" name="ci"></textarea>
                                                    </div>
                                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                                        <label class="form-label fw-bolder">Grossesse Allaitement</label>
                                                        <textarea class="form-control" style="height: 50px" value="{{ $acte->grossesse_allait }}" name="grosse"></textarea>
                                                    </div>
                                                </div>

                                                <div class="d-grid gap-2 mt-3">
                                                    <button type="submit" class="btn btn-outline-primary btn-block">Editer</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</tr>
                        @endforeach
                    @else
                    <tr>
                        <td>Aucune donnée</td>
                        <td>Aucune donnée</td>
                        <td>Aucune donnée</td>
                        <td>Aucune donnée</td>
                        <td>Aucune donnée</td>
                    </tr>
                    @endif



	                </tbody>
	              </table>
                </div>
                <div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
					<form method="POST" enctype="multipart/form-data" action="{{ route('newMedicamentSuperAdmin') }}">
						@csrf
						<div class="card border-0 shadow-none mb-0">
							<div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 d-flex flex-column align-content-between d-none">
                                        <label class="form-label fw-bolder">Nom Medicament</label>
                                        <input type="text" class="form-control mb-1" value="{{ old('id') }}" name="id">
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Nom Medicament</label>
                                        <input type="text" class="form-control mb-1" value="{{ old('nom_commercial') }}" name="nm">
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">DCI</label>
                                        <input type="text" class="form-control mb-1" value="{{ old('dci') }}" name="dci">
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Taux Remise</label>
                                        <input type="text" class="form-control mb-1" value="{{ old('taux_rem') }}" name="tr">
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Posologie</label>
                                        <textarea class="form-control" style="height: 50px" value="{{ old('posologie') }}" name="poso"></textarea>
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Effets Indesirables</label>
                                        <textarea class="form-control" style="height: 50px" value="{{ old('effet_indesir') }}" name="effet"></textarea>
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Indication</label>
                                        <textarea class="form-control" style="height: 50px" value="{{ old('indication') }}" name="indi"></textarea>
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Contre Indication</label>
                                        <textarea class="form-control" style="height: 50px" value="{{ old('contre_indication') }}" name="ci"></textarea>
                                    </div>
                                    <div class="col-md-12 d-flex flex-column align-content-between">
                                        <label class="form-label fw-bolder">Grossesse Allaitement</label>
                                        <textarea class="form-control" style="height: 50px" value="{{ old('grossesse_allait') }}" name="grosse"></textarea>
                                    </div>
                                </div>

                                <div class="d-grid gap-2 mt-3">
                                    <button type="submit" class="btn btn-outline-primary btn-block">Soumettre</button>
                                </div>
							</div>
						</div>

					</form>
                </div>
              </div><!-- End Bordered Tabs -->

            </div>
          </div>


        </div>

	<!--/User Dashboard-->


@endsection

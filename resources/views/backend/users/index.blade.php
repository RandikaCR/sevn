@extends('layouts.backend')

@section('page_title')
    Users | MDRT MCC Admin
@endsection

@section('breadcrumb')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">Users</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">MDRT MCC Admin</a></li>
                        <li class="breadcrumb-item active">Users</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
@endsection

@section('content')

    <div class="row mb-4">
        <div class="col-sm-12 d-flex justify-content-end">
            <a class="btn btn-primary" href="{{ url('admin/users/create') }}">CREATE NEW</a>
        </div>
    </div>

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">All Users</h4>
                </div><!-- end card header -->

                <div class="card-body">
                    <div class="live-preview">
                        <div class="table-responsive">
                            <table class="table table-striped table-nowrap align-middle mb-0">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th class="text-center" scope="col">Role</th>
                                    <th class="text-center" scope="col">Status</th>
                                    <th class="text-end" scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($users as $user)
                                    <tr id="row-{{ $user->id }}">
                                        <td class="fw-medium">{{ $user->id }}</td>
                                        <td>{{ $user->first_name .' '. $user->last_name }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td class="text-center">{{ $user->userRole->display_name }}</td>
                                        <td class="text-center">
                                            <span class="badge status-badge {{ generalStatus($user->status)->class }}">{{ generalStatus($user->status)->text }}</span>
                                        </td>
                                        <td class="text-end">
                                            <div class="d-flex justify-content-end align-items-center">
                                                <div class="form-check form-switch form-switch-success form-switch-md">
                                                    <input class="form-check-input status" data-id="{{ $user->id }}" type="checkbox" role="switch"  {{ ($user->status == 1) ? 'checked': '' }} >
                                                </div>
                                                <div>
                                                    <a href="{{ route('backend.users.edit', $user->id) }}" class="btn btn-primary btn-sm waves-effect waves-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><span class="mdi mdi-pencil"></span></a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- end card-body -->
            </div><!-- end card -->
        </div>
    </div>

    <input type="hidden" id="route_status" value="{{ route('backend.users.status') }}" />
@endsection


@section('scripts')

    <!--jquery cdn-->
    <script src="{{ asset('assets/backend/packages/code.jquery.com/jquery-3.6.0.min.js') }}" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="{{ asset('assets/backend/packages/cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/js/select2.min.js') }}"></script>

    <script src="{{ asset('assets/backend/js/pages/select2.init.js') }}"></script>

@endsection

@section('custom_scripts')
    <script>
        $(document).ready(function (){

            $('.table').on('change', '.status', function (){
                $id = $(this).data('id');
                $url = $('#route_status').val();
                $rowId = '#row-' + $id;
                $.ajax({
                    url: $url,
                    dataType: 'json',
                    data: {
                        "id": $id,
                        "_token": csrf_token()
                    },
                    method: 'POST',
                    beforeSend: function ($jqXHR, $obj) {

                    },
                    success: function ($res, $textStatus, $jqXHR) {
                        $($rowId).find('.status-badge').removeClass('bg-success bg-warning').addClass($res.class);
                        $($rowId).find('.status-badge').html($res.text);
                    },
                    error: function ($jqXHR, $textStatus, $errorThrown) {

                    }
                });
            });
        });
    </script>
@endsection

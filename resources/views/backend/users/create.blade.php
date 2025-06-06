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
            <a class="btn btn-primary" href="{{ url('admin/users') }}">ALL USERS</a>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-sm-8">
            <form method="POST" action="{{ route('backend.users.store') }}">
                @csrf
                <input type="hidden" name="id" value="{{ isset($user) ? $user->id : 0 }}">
                <div class="card">
                    <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">User Details</h4>
                    </div><!-- end card header -->

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="user-role" class="form-label">User Role</label>
                                    <select class="form-control" name="user_role_id" required>
                                        @foreach($user_roles as $role)
                                            <option value="{{ $role->id }}" {{ !empty($user) && $user->user_role_id == $role->id ? 'selected' : '' }}>{{ $role->user_role }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="first_name" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="first_name" name="first_name" value="{{ !empty($user) ? $user->first_name : '' }}" placeholder="Enter here..." required>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="last_name" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="last_name" name="last_name" value="{{ !empty($user) ? $user->last_name : '' }}" placeholder="Enter here..." required>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="company_name" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="company_name" name="company_name" value="{{ !empty($user) ? $user->company_name : '' }}" placeholder="Enter here...">
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="mdrt_id_number" class="form-label">MDRT ID</label>
                                    <input type="text" class="form-control" id="mdrt_id_number" name="mdrt_id_number" value="{{ !empty($user) ? $user->mdrt_id_number : '' }}" placeholder="Enter here...">
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="mdrt_achieved_times" class="form-label">MDRT Achieved Times</label>
                                    <input type="text" class="form-control" id="mdrt_achieved_times" name="mdrt_achieved_times" value="{{ !empty($user) ? $user->mdrt_achieved_times : '' }}" placeholder="Enter here...">
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="birthday" class="form-label">Date Of Birth</label>
                                    <input type="date" class="form-control" id="birthday" name="birthday" value="{{ !empty($user) ? date('Y-m-d', strtotime($user->birthday)) : '' }}" placeholder="Enter here...">
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div>
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter here..." value="{{ !empty($user) ? $user->email : '' }}" {{ !empty($user) ? 'readonly' : '' }} required>
                                </div>
                            </div>
                            @if(empty($user))
                                <div class="col-md-4 mb-3">
                                    <div>
                                        <label for="password" class="form-label">Password</label>
                                        <input type="text" class="form-control" id="password" name="password" placeholder="Enter here..." value="UMDRTMcc@1234" required>
                                    </div>
                                </div>
                            @endif

                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">SAVE</button>
                            </div>
                        </div>
                    </div>
                </div><!-- end card -->
            </form>
        </div>
    </div>

@endsection

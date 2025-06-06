@extends('layouts.backend')

@section('page_title')
    All Products
@endsection

@section('styles')
    <link href="{{ asset('assets/backend/packages/cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/css/select2.min.css') }}" rel="stylesheet" />
@endsection

@section('css')

@endsection

@section('header_buttons')
    <div class="row">
        <div class="col-sm-12 d-flex justify-content-end mb-3">
            <a href="{{ url('admin/products/create') }}" class="btn btn-primary">
                <span class="mdi mdi-plus-box me-2"></span>
                Add New
            </a>
        </div>
    </div>
@endsection

@section('content')

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <form method="GET" action="">
                        @csrf
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Search</label>
                                <input class="form-control" type="text" name="keyword" placeholder="Enter keyword here...." value="{{ $keyword }}">
                            </div>
                            <div class="col-sm-2">
                                <h6 class="fw-semibold">Status</h6>
                                <select class="js-example-basic-single" name="status">
                                    <option value="">All</option>
                                    <option value="0" {{ (isset($status) && $status == 0) ? 'selected' : '' }}>Inactive</option>
                                    <option value="1" {{ (isset($status) && $status == 1) ? 'selected' : '' }}>Active</option>
                                </select>
                            </div>
                            <div class="col-sm-3 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary">
                                    <span class="mdi mdi-magnify me-2"></span>
                                    Search
                                </button>
                                <a href="{{ url('admin/products') }}" class="btn btn-outline-dark waves-effect waves-light ms-2">
                                    <span class="mdi mdi-restore me-2"></span>
                                    Clear
                                </a>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">All Products</h4>
                    <div class="flex-shrink-0">
                    </div>
                </div><!-- end card header -->

                <div class="card-body">
                    <div class="live-preview">
                        <div class="row">
                            <div class="col-xl-612">
                                <div class="table-responsive mt-4 mt-xl-0">
                                    <table class="table table-hover table-striped align-middle table-nowrap mb-0">
                                        <thead>
                                        <tr>
                                            <th class="text-center" scope="col">
                                                <p class="mb-0">ID</p>
                                            </th>
                                            <th class="text-center" scope="col" colspan="2">
                                                <p class="mb-0">Product</p>
                                            </th>
                                            <th class="text-center" scope="col">
                                                <p class="mb-0">Price</p>
                                            </th>
                                            <th class="text-center" scope="col">
                                                <p class="mb-0">Status</p>
                                            </th>
                                            <th class="text-center" scope="col">
                                                <p class="mb-0">Actions</p>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($products as $product)
                                            <tr id="row-{{ $product->id }}">
                                                <td class="fw-medium text-center">
                                                    <p class="mb-0">{{ $product->id }}</p>
                                                </td>
                                                <td>
                                                    <div class="avatar-sm bg-light rounded p-1">
                                                        <img src="{{ asset('assets/common/images/' .$product->primary_image) }}" class="img-fluid d-block" alt="product name">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0">{{ $product->product }}</p>
                                                </td>
                                                <td class="text-end">
                                                    <p class="mb-0 fw-bold">{{ priceWithCurrency($product->price) }}</p>
                                                </td>

                                                <td class="text-center">
                                                    <p class="mb-0"><span class="badge status-badge {{ generalStatus($product->status)->class }}">{{ generalStatus($product->status)->text }}</span></p>
                                                </td>
                                                <td class="text-end">
                                                    <div class="d-flex justify-content-end align-items-center">
                                                        <div class="form-check form-switch form-switch-success form-switch-md">
                                                            <input class="form-check-input status" data-id="{{ $product->id }}" type="checkbox" role="switch"  {{ ($product->status == 1) ? 'checked': '' }} >
                                                        </div>
                                                        <div>
                                                            <a href="{{ route('products.edit', $product->id) }}" class="btn btn-primary btn-sm waves-effect waves-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><span class="mdi mdi-pencil"></span></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->

                        <div class="mt-5">
                            {{--Paginaiton--}}
                            {!! $products->links('vendor.pagination.backend') !!}
                        </div>
                    </div>
                </div><!-- end card-body -->
            </div><!-- end card -->
        </div>
        <!-- end col -->
    </div>

    <input type="hidden" id="route_status" value="{{ route('backend.products.status') }}" />
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

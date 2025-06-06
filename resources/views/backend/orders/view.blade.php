@extends('layouts.backend')

@section('page_title')
    Order # {{ str_pad($order->id, 4 , 0, STR_PAD_LEFT) }}
@endsection

@section('styles')
    <link href="{{ asset('assets/backend/packages/cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/css/select2.min.css') }}" rel="stylesheet" />
@endsection

@section('css')
@endsection

@section('header_buttons')
    <div class="row">
        <div class="col-sm-12 d-flex justify-content-end mb-3">
            <a href="{{ url('admin/orders') }}" class="btn btn-primary">
                <span class="mdi mdi-format-list-bulleted-square me-2"></span>
                All Orders
            </a>
        </div>
    </div>
@endsection

@section('content')

    <div class="row">
        <div class="col-xl-9">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title flex-grow-1 mb-0">Order Details</h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="table-responsive">
                                <table class="table table-borderless table-centered align-middle table-nowrap mb-0">
                                    <thead class="text-muted table-light">
                                    <tr>
                                        <th scope="col" colspan="2">Billing Details</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Name</td>
                                        <th>{{ $order->b_first_name . ' ' . $order->b_last_name}}</th>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <th>{{ $order->b_email}}</th>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <th>{{ $order->b_phone}}</th>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <th>{{ $order->b_street_address}}
                                            <br>
                                            {{ $order->b_address2}}
                                            <br>
                                            {{ $order->b_town}}
                                            <br>
                                            {{ $order->b_city}}
                                            <br>
                                            {{ $order->b_postcode}}
                                        </th>
                                    </tr>
                                    </tbody><!-- end tbody -->
                                </table>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="table-responsive">
                                <table class="table table-borderless table-centered align-middle table-nowrap mb-0">
                                    <thead class="text-muted table-light">
                                    <tr>
                                        <th scope="col" colspan="2">Shipping Details</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Name</td>
                                        <th>{{ $order->s_first_name . ' ' . $order->s_last_name}}</th>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <th>{{ $order->s_email}}</th>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <th>{{ $order->s_phone}}</th>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <th>{{ $order->s_street_address}}
                                            <br>
                                            {{ $order->s_address2}}
                                            <br>
                                            {{ $order->s_town}}
                                            <br>
                                            {{ $order->s_city}}
                                            <br>
                                            {{ $order->s_postcode}}
                                        </th>
                                    </tr>
                                    </tbody><!-- end tbody -->
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end card-->
            <div class="card">
                <div class="card-header">
                    <div class="d-sm-flex align-items-center">
                        <h5 class="card-title flex-grow-1 mb-0">Order Products</h5>
                        <div class="flex-shrink-0 mt-2 mt-sm-0">

                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive table-card">
                        <table class="table table-nowrap align-middle table-striped mb-0">
                            <thead class="table-light text-muted">
                            <tr>
                                <th scope="col">Product Details</th>
                                <th class="text-end" scope="col">Item Price</th>
                                <th class="text-center" scope="col">Quantity</th>
                                <th scope="col" class="text-end">Total Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($order->products['products'] as $product)
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0 avatar-md bg-light rounded p-1">
                                                <img src="{{ asset('assets/common/images/' . $product->primary_image) }}" alt="" class="img-fluid d-block">
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h5 class="fs-15"><a href="javascript:void(0);" class="link-primary">{{ $product->product }}</a></h5>
                                                @if(!empty($product->product_label) && !empty($product->product_label_value))
                                                    <p class="mb-2"><span>{{ $product->product_label }}</span> : <span class="fw-bold">{{ $product->product_label_value }}</span></p>
                                                @endif
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-end">{{ priceWithCurrency($product->price) }}</td>
                                    <td class="text-center">{{ $product->quantity }}</td>
                                    <td class="fw-medium text-end">
                                        {{ priceWithCurrency($product->total) }}
                                    </td>
                                </tr>
                            @endforeach

                            <tr class="border-top border-top-dashed">
                                <td colspan="2"></td>
                                <td colspan="2" class="fw-medium p-0">
                                    <table class="table table-borderless mb-0">
                                        <tbody>
                                        <tr>
                                            <td>Sub Total :</td>
                                            <td class="text-end">{{ priceWithCurrency($order->products['sub_total']) }}</td>
                                        </tr>
                                        @if(!empty($order->products['discount']))
                                            <tr class="text-danger">
                                                <td>
                                                    <span>Discount : </span>
                                                    @if(!empty($order->discount_label))
                                                        <br>
                                                        <span>{{ $order->discount_label }} </span>
                                                    @endif
                                                </td>
                                                <td class="text-end">-{{ priceWithCurrency($order->products['discount']) }}</td>
                                            </tr>
                                        @endif
                                        <tr class="border-top border-top-dashed fs-14">
                                            <th scope="row">Total:</th>
                                            <th class="text-end">{{ priceWithCurrency($order->products['total']) }}</th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--end card-->
        </div>
        <!--end col-->
        <div class="col-xl-3">

            <div class="card">
                <div class="card-header">
                    <div class="d-flex">
                        <h5 class="card-title flex-grow-1 mb-0">Order Information</h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <td>Order ID</td>
                                <th>#{{ orderIdFormat($order->id) }}</th>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <th><h5><span class="badge {{ $order->order_status_label_backend }}"> {{ $order->order_status_backend }}</span></h5></th>
                            </tr>
                            <tr>
                                <td>Payment Method</td>
                                <th>{{ $order->payment_method }}</th>
                            </tr>
                            <tr>
                                <td>Order Time</td>
                                <th>{{ dateTimeFormat($order->created_at) }}</th>
                            </tr>
                            @if(!empty($order->comment))
                                <tr>
                                    <td>Comment</td>
                                    <th>{{ $order->comment }}</th>
                                </tr>
                            @endif
                        </table>
                    </div>
                </div>
            </div>


            <div class="card">
                <form method="POST" action="{{ route('backend.orders.status') }}">
                    @csrf
                    <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1"><span class="me-1">Order Status</span></h4>
                        <div class="flex-shrink-0">
                        </div>
                    </div><!-- end card header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <h6 class="fw-semibold">Status</h6>
                                <select class="js-example-basic-single" name="order_status_id">
                                    @foreach($order_statuses as $status)
                                        <option value="{{ $status->id }}" {{ $status->id == $order->status ? 'selected' : '' }}>{{ $status->order_status_backend }}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-12 d-flex justify-content-end">
                                <input type="hidden" name="order_id" value="{{ $order->id }}">
                                <a href="{{ url('/admin/orders/' . $order->id) }}" class="btn btn-outline-dark waves-effect waves-light me-2"><i class="mdi mdi-restore me-1"></i>Reset</a>
                                <button type="submit" class="btn btn-secondary waves-effect waves-light"><i class="mdi mdi-content-save me-1"></i>SAVE</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            @if(!empty(count($order->order_attachments)))
                <div class="card">
                    <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1"><span class="me-1">Order Attachments</span></h4>
                        <div class="flex-shrink-0">
                        </div>
                    </div><!-- end card header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        @php
                                            $aNo = 1;
                                        @endphp
                                        @foreach($order->order_attachments as $oa)
                                            <tr>
                                                <td class="fw-bold">Attachment {{ $aNo }}</td>
                                                <th class="text-end">
                                                    <span class="btn btn-primary btn-sm waves-effect waves-light open-attachment" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-bs-placement="top" title="View" data-filename="{{ $oa->file }}" data-note="{{ $oa->note }}"><span class="mdi mdi-magnify"></span></span>
                                                </th>
                                            </tr>

                                            @php
                                                $aNo++;
                                            @endphp
                                        @endforeach
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif


        </div>
        <!--end col-->
    </div>


    <div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-body text-center p-5">
                    <img src="" class="img-fluid" alt="attachment" id="attachment-image">
                    <div class="mt-4">
                        <p class="text-muted mb-4" id="attachment-note"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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

            var $attachmentPath = $('#common_assets_attachment_files_path').val();

            $('.open-attachment').on('click', function ($e){
                $image = $(this).data('filename');
                $note = $(this).data('note');

                $('#attachment-image').attr('src', '');
                $('#attachment-note').html('');
                $fileWithPath = $attachmentPath + '/' + $image;

                $('#attachment-image').attr('src', $fileWithPath);
                $('#attachment-note').html($note);


            });
        });
    </script>

@endsection

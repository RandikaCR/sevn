@extends('layouts.backend')

@section('page_title')
    Product

    @if(isset($product))
        #{{ $product->id }}
    @endif
@endsection

@section('styles')
    <link href="{{ asset('assets/backend/packages/cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/css/select2.min.css') }}" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('assets/backend/libs/croppie/croppie.min.css') }}">

@endsection

@section('css')

    <style type="text/css">

        .img-overlay-area{
            position: absolute;
            background: rgba(0,0,0,0.2);
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            opacity: 0;
            -webkit-transition: all .5s ease-in-out;
            -o-transition: all .5s ease-in-out;
            -moz-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
        }

        .img-action:hover .img-overlay-area{
            opacity: 1;
            -webkit-transition: all .5s ease-in-out;
            -o-transition: all .5s ease-in-out;
            -moz-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
            cursor: pointer;
        }

        .img-border{
            border: 1px solid #eee;
        }

    </style>

@endsection

@section('header_buttons')
    <div class="row">
        <div class="col-sm-12 d-flex justify-content-end mb-3">
            <a href="{{ url('admin/products') }}" class="btn btn-primary">
                <span class="mdi mdi-format-list-bulleted-square me-2"></span>
                Product
            </a>
        </div>
    </div>
@endsection

@section('content')

    <form method="POST" action="{{ route('products.store') }}">
        @csrf
        <input type="hidden" name="id" value="{{ isset($product) ? $product->id : '' }}">
        <input type="hidden" id="temp_product_id" name="temp_product_id" value="{{ $temp_product_id }}">
        <div class="row">
            <div class="col-sm-12 mb-4">
                @if($errors->any())
                    @foreach ($errors->all() as $error)
                        <div class="alert alert-danger">
                            {{$error}}
                        </div>
                    @endforeach
                @endif
            </div>
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">

                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h4 class="card-title">Product Details</h4>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-secondary waves-effect waves-light save-this-form"><i class="mdi mdi-content-save me-1"></i>SAVE</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-10 mb-4">
                                <label>Product Name</label>
                                <input class="form-control" type="text" id="product" name="product" placeholder="Enter here...." value="{{ isset($product) ? $product->product : '' }}">
                            </div>

                            <div class="col-sm-2 mb-4">
                                <label>Price</label>
                                <input class="form-control" type="text" id="price" name="price" placeholder="Enter here...." value="{{ isset($product) ? $product->price : '' }}">
                            </div>

                            <div class="col-sm-12 mb-4">
                                <label>Description</label>
                                <textarea id="description" name="description">
                                     {{ isset($product) ? $product->description : '' }}
                                </textarea>
                            </div>
                            <div class="col-sm-12 mb-4">
                                <label>Product Images</label>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="file">
                                                <input type="file" accept="image/*" class="file-styled-primary" id="thumb_image" >
                                            </label>
                                        </div>
                                        <div class="row" style="">
                                            <div class="col-12" id="uploaded_thumb">
                                                <div id="thumb_image_demo" style=""></div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="text-success" id="image-status"></p>
                                            </div>
                                            <div class="col-md-4 text-right">
                                                <span class="btn btn-info btn-sm thumb_crop">Apply</span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-6 d-flex">
                                        <div class="row" id="uploaded_image">
                                            @if(!empty($images))
                                                @foreach($images as $img )
                                                    <div class="col-md-6 mb-20 img-border" style="height: fit-content;" id="row-{{ $img->id }}">
                                                        <div class="d-flex align-items-center justify-content-center img-action">
                                                            <img class="img-fluid img-bordered" src="{{ url('assets/common/images/'.$img->product_image) }}">
                                                            @if( $img->is_primary == 1 )
                                                                <span class="badge bg-success" style="position: absolute;top: 10px;right: 10px;"><i class="mdi mdi-key"></i></span>
                                                            @endif
                                                            <div class="img-overlay-area d-flex justify-content-center align-items-center">
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-xs delete-image" data-id="{{ $img->id }}" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><i class="mdi mdi-delete"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-success btn-xs primary-image ml-5" data-id="{{ $img->id }}" data-toggle="tooltip" data-placement="top" title="" data-original-title="Make this Primary Image?"><i class="mdi mdi-key"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

    <input type="hidden" id="route_image_delete" value="{{ route('backend.products.deleteImage') }}">
    <input type="hidden" id="route_image_set_primary" value="{{ route('backend.products.setPrimaryImage') }}">

@endsection


@section('scripts')

    <!--jquery cdn-->
    <script src="{{ asset('assets/backend/packages/code.jquery.com/jquery-3.6.0.min.js') }}" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="{{ asset('assets/backend/packages/cdn.jsdelivr.net/npm/select2%404.1.0-rc.0/dist/js/select2.min.js') }}"></script>

    <script src="{{ asset('assets/backend/js/pages/select2.init.js') }}"></script>

    <!-- ckeditor -->
    <script src="{{ asset('assets/backend/libs/%40ckeditor/ckeditor5-build-classic/build/ckeditor.js') }}"></script>


    {{--    <script src="{{ asset('assets/backend/js/pages/ecommerce-product-create.init.js') }}"></script>--}}

    <!-- croppie -->
    <script src="{{ asset('assets/backend/libs/croppie/croppie.min.js') }}"></script>


@endsection

@section('custom_scripts')
    <script>

        ClassicEditor.create(document.querySelector("#description"))
            .then(function (e) {
                e.ui.view.editable.element.style.height = "200px";
            })
            .catch(function (e) {
                console.error(e);
            });


        $image_thumb = $('#thumb_image_demo').croppie({
            enableExif: true,
            viewport: {
                width:250,
                height:250,
                type:'square' //circle
            },
            boundary:{
                width:300,
                height:300
            }
        });

        $('#thumb_image').on('change', function(){
            var reader = new FileReader();
            reader.onload = function (event) {
                $image_thumb.croppie('bind', {
                    url: event.target.result
                });
            };
            reader.readAsDataURL(this.files[0]);
            $('#uploaded_thumb').show();
        });


        $('.thumb_crop').click(function(event){

            $image_thumb.croppie('result', {
                type: 'canvas',
                /*size: 'original'*/
                size: {
                    width: 1000,
                    height: 1000
                }
            }).then(function(response){

                $productId = $('#temp_product_id').val();

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    url: "{{ route('backend.products.imageUpload') }}",
                    type: "POST",
                    data: {
                        image:response,
                        product_id: $productId,
                    },
                    success: function (data) {
                        $('#image-status').html(data.status);
                        var img = '<div class="col-md-6 mb-20 img-border"><div class="d-flex align-items-center justify-content-center"><img class="img-fluid img-bordered" src="{{ url( '/assets/common/images' ) }}/'+data.filename+'" ></div></div>';
                        $('#uploaded_image').append(img);
                    }
                });

            })
        });


        $('#uploaded_image').on('click', '.delete-image', function ($e){
            $e.preventDefault();
            $this = $(this);
            $id = $($this).data('id');

            $url = $('#route_image_delete').val();

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
                    $($this).parent().parent().parent().fadeOut('slow');
                    setTimeout(function (){
                        $($this).parent().parent().parent().remove();
                    },1000);
                },
                error: function ($jqXHR, $textStatus, $errorThrown) {

                }
            });


        });

        $('#uploaded_image').on('click', '.primary-image', function ($e){
            $e.preventDefault();
            $this = $(this);
            $id = $($this).data('id');

            $url = $('#route_image_set_primary').val();

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
                    location.reload();
                },
                error: function ($jqXHR, $textStatus, $errorThrown) {

                }
            });


        });


    </script>
@endsection

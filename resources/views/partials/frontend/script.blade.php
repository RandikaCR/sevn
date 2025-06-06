
<input type="hidden" id="auth-user-id" value="{{ !empty(Auth::user()) ? Auth::user()->id : 0 }}">


<script type="text/javascript" src="{{ asset('assets/frontend/js/bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/swiper-bundle.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/carousel.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/bootstrap-select.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/lazysize.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/count-down.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/wow.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/multiple-modal.js') }}"></script>
<script src="{{ asset('assets/backend/libs/sweetalert2/sweetalert2.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('assets/frontend/js/main.js') }}"></script>

@yield('js')

<script src="{{ asset('assets/frontend/js/sibforms.js') }}" defer></script>

<script>
    function csrf_token(){
        $token = "{{ csrf_token() }}";
        return $token;
    }
</script>

@yield('script')

<script>
    $(document).ready(function (){

        $('.logout').on('click', function ($e){
            $e.preventDefault();

            Swal.fire({
                title: "Are you sure?",
                text: "You want to end this session!",
                icon: "warning",
                showCancelButton: !0,
                showLoaderOnConfirm: true,
                confirmButtonText: "Yes, Log Out!",
                cancelButtonText: "No, cancel!",
                confirmButtonClass: "btn btn-danger w-xs me-2 mt-2",
                cancelButtonClass: "btn btn-secondary w-xs mt-2",
                buttonsStyling: !1,
                showCloseButton: !0,
            }).then((result) => {
                if (result.isConfirmed) {

                    setTimeout(function() {
                        $.ajax({
                            url: "{{ route('frontend.appLogout') }}",
                            type: 'POST',
                            data: {
                                _token: csrf_token()
                            },
                            dataType: 'json',
                            beforeSend: function ($jqXHR, $obj) {
                                Swal.fire({
                                    title: "Processing...",
                                    text: "Please wait",
                                    imageUrl: "{{ asset('assets/common/images/ajax-loader.gif') }}",
                                    showConfirmButton: false,
                                    allowOutsideClick: false
                                });
                            },
                            success: function ($response, $textStatus, $jqXHR) {
                                Swal.fire('Done!', 'Logged Out!', 'success');
                                setTimeout(function(){
                                    location.reload();
                                },1000);
                            },
                            error: function ($jqXHR, $textStatus, $errorThrown) {
                                Swal.fire('Oops...', 'Something went wrong with the System!', 'error');
                            }
                        });

                    }, 50);
                }
            });


        });

    });

</script>

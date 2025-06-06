<input type="hidden" id="_csrf_token" value="{{ csrf_token() }}" />
<input type="hidden" id="common_assets_path" value="{{ asset('assets/common') }}" />
<input type="hidden" id="common_assets_attachment_files_path" value="{{ asset('assets/common/files/attachments/') }}" />
<input type="hidden" id="routeSiteUrl" value="{{ url('') }}">
<input type="hidden" id="routeDashboard" value="{{ route('backend.dashboard') }}">
<input type="hidden" id="routeLogIn" value="{{ route('login') }}">
<input type="hidden" id="routeLogOut" value="{{ route('logout') }}">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    function setMainSiteUrl($url){
        var $siteUrl = $('#routeSiteUrl').val();
        return $siteUrl +'/'+ $url;
    }
    const $siteMainUrlForAssets = setMainSiteUrl('');
</script>

<script src="{{ asset('assets/backend/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/backend/libs/simplebar/simplebar.min.js') }}"></script>
<script src="{{ asset('assets/backend/libs/node-waves/waves.min.js') }}"></script>
<script src="{{ asset('assets/backend/libs/feather-icons/feather.min.js') }}"></script>
<script src="{{ asset('assets/backend/js/pages/plugins/lord-icon-2.1.0.js') }}"></script>
<script src="{{ asset('assets/backend/js/plugins.js') }}"></script>
<script src="{{ asset('assets/backend/libs/sweetalert2/sweetalert2.min.js') }}"></script>



@yield('scripts')

<!-- App js -->
<script src="{{ asset('assets/backend/js/app.js') }}"></script>

<script src="{{ asset('assets/common/js/app.js') }}"></script>
<script src="{{ asset('assets/common/js/common.js') }}"></script>

<script src="{{ asset('assets/backend/libs/jquery-toast-plugin-master/src/jquery.toast.js') }}"></script>
<script src="{{ asset('assets/backend/js/pages/toastr.js') }}"></script>

@yield('custom_scripts')


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

<!-- Toast -->
@if(session()->has('success'))
    <script>
        $.toast({
            heading: 'Success!',
            text: '{{ session()->get('success') }}',
            position: 'top-right',
            loaderBg: '#ff6849',
            icon: 'success',
            hideAfter: 3500,
            stack: 6
        });
    </script>
@endif

@if(session()->has('error'))
    <script>
        $.toast({
            heading: 'Error!',
            text: '{{ session()->get('error') }}',
            position: 'top-right',
            loaderBg: '#ff6849',
            icon: 'error',
            hideAfter: 3500

        });
    </script>
@endif

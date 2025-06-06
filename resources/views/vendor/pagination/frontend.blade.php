@if ($paginator->hasPages())
<div class="pagination-area">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            @if ($paginator->onFirstPage())
                <li class="page-item disabled">
                    <a class="page-link" href="javascript:void(0);"><i class="fa-solid fa-angle-left"></i></a>
                </li>
            @else
                <li class="page-item">
                    <a href="{{ $paginator->previousPageUrl() }}" class="page-link"><i class="fa-solid fa-angle-left"></i></a>
                </li>
            @endif


                @foreach ($elements as $element)
                    {{-- "Three Dots" Separator --}}
                    @if (is_string($element))
                        <li class="page-item disabled"><a class="page-link" href="javascript:void(0);">{{ $element }}</a></li>
                    @endif

                    {{-- Array Of Links --}}
                    @if (is_array($element))
                        @foreach ($element as $page => $url)
                            @if ($page == $paginator->currentPage())
                                <li class="page-item active"><a class="page-link" href="javascript:void(0);">{{ $page }}</a></li>
                            @else
                                <li class="page-item"><a class="page-link" href="{{ $url }}">{{ $page }}</a></li>
                            @endif
                        @endforeach
                    @endif
                @endforeach


                @if ($paginator->hasMorePages())
                    <li class="page-item">
                        <a class="page-link" href="{{ $paginator->nextPageUrl() }}"><i class="fa-solid fa-angle-right"></i></a>
                    </li>
                @else
                    <li class="page-item">
                        <a class="page-link disabled" href="javascript:void(0);"><i class="fa-solid fa-angle-right"></i></a>
                    </li>

                @endif
        </ul>
    </nav>
</div>
@endif




@extends(config('mnara.views.layouts.master'))

@section('content')
    <div class="right_col" role="main">
        <div class="alert alert-danger lead">
            <i class="fa fa-exclamation-triangle fa-1x"></i> You are not permitted to {{$message}}.
        </div>
    </div>
@endsection
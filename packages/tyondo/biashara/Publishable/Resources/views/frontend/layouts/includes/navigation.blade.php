<div class="navigation">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                <ul class="nav navbar-nav">
                    <li><a href="{{route('biashara.index')}}" class="act">Home</a></li>

                    <!-- Mega Menu -->
                    {{-- Activate and use this segment when grown --}}
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Orders <b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-3">
                            <div class="row">
                                <div class="col-sm-3">
                                    <ul class="multi-column-dropdown">
                                        <h6>Mobiles</h6>
                                        <li><a href="{{route('biashara.products.list')}}">Mobile Phones</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Mp3 Players <span>New</span></a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Popular Models</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">All Tablets<span>New</span></a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <ul class="multi-column-dropdown">
                                        <h6>Accessories</h6>
                                        <li><a href="{{route('biashara.products.list')}}">Laptop</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Desktop</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Wearables <span>New</span></a></li>
                                        <li><a href="{{route('biashara.products.list')}}"><i>Summer Store</i></a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-2">
                                    <ul class="multi-column-dropdown">
                                        <h6>Home</h6>
                                        <li><a href="{{route('biashara.products.list')}}">Tv</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Camera</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">AC</a></li>
                                        <li><a href="{{route('biashara.products.list')}}">Grinders</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <div class="w3ls_products_pos">
                                        <h4>30%<i>Off/-</i></h4>
                                        <img src="{{asset('vendor/tyondo/biashara/images/1.jpg')}}" alt=" " class="img-responsive" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </ul>
                    </li>

                    {{--<li><a href="{{route('biashara.about')}}">About Us</a></li>
                    <li><a href="{{route('biashara.contact')}}">Mail Us</a></li>--}}
                </ul>
            </div>
        </nav>
    </div>
</div>
<div class="header" id="home1">
    <div class="container">
        @if(!Auth::check())
            <div class="w3l_login">
                <a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
            </div>
        @else
            <div class="w3l_login">
                <a href="{{route('mnara.user.profile',Auth::user()->id)}}"><span class="glyphicon glyphicon-user" aria-hidden="true"> Profile</span></a>
            </div>
        @endif
        <div class="w3l_logo">
            <h1><a href="{{route('biashara.products.list')}}">{{config('biashara.name')}}<span>{{config('biashara.slogan')}}</span></a></h1>
        </div>
        <div class="search">
            <input class="search_box" type="checkbox" id="search_box">
            <label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
            <div class="search_form">
                <form action="#" method="post">
                    <input type="text" name="Search" placeholder="Search...">
                    <input type="submit" value="Send">
                </form>
            </div>
        </div>
        <div class="cart cart box_1">
            <form action="#" method="post" class="last">
                <input type="hidden" name="cmd" value="_cart" />
                <input type="hidden" name="display" value="1" />
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
            </form>
        </div>
    </div>
</div>
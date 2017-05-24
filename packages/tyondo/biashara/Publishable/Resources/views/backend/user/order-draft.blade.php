@extends(config('mnara.views.layouts.master'))
@section('css')
    <style>
        .table > tbody > tr > .emptyrow {
            border-top: none;
        }

        .table > thead > tr > .emptyrow {
            border-bottom: none;
        }

        .table > tbody > tr > .highrow {
            border-top: 3px solid;
        }
    </style>
@endsection
@section('content')
    <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Orders</h3>
                </div>
            </div>
            <div class="clearfix"></div>


            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        @if(isset($order_details))
                        <h3 class="text-center"><strong>Order #{{$order_details['order_number']->orderNumber->order_number}}</strong></h3>
                        @else
                        <h3>No orders</h3>
                        @endif
                    </div>
                    <div class="panel-body">
                        @if(isset($order_details))
                        <div class="table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td><strong>Item Name</strong></td>
                                    <td class="text-center"><strong>Item Price</strong></td>
                                    <td class="text-center"><strong>Item Quantity</strong></td>
                                    <td class="text-right"><strong>Total</strong></td>
                                    <td class="text-right"><strong>Action</strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($order_details['details'] as $order)
                                <tr id="row{{$order->id}}">
                                    <td>{{$order->product}}</td>
                                    <td class="text-center" id="unit_price_val{{$order->id}}">{{$order->unit_price}}</td>
                                    <td class="text-center" id="quantity_val{{$order->id}}">{{$order->quantity}}</td>
                                    <td class="text-right" id="product_total_order_val{{$order->id}}">{{$order->product_total_order}}</td>
                                    <td >
                                        <input type='button' class="edit_button" id="edit_button{{$order->id}}" value="edit" onclick="edit_row('{{$order->id}}');">
                                        <input type='button' class="save_button " id="save_button{{$order->id}}" value="save" onclick="save_row('{{$order->id}}');">
                                        <input type='button' class="delete_button" id="delete_button{{$order->id}}" value="delete" onclick="delete_row('{{$order->id}}');">
                                    </td>
                                    {{--<td class="text-right"><i class=" fa fa-pencil-square-o"></i></td>
                                    <td class="text-right"><i class=" fa fa-trash-o"></i></td>--}}
                                </tr>
                                @endforeach
                                <tr>
                                    <td class="highrow"></td>
                                    <td class="highrow"></td>
                                    <td class="highrow text-center"><strong>Subtotal</strong></td>
                                    <td class="highrow text-right">
                                        {{isset($order_details)? $order_details['sub_total'] : null}}
                                    </td>
                                    <td class="highrow text-center"></td>
                                </tr>
                                <tr>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow text-center"><strong>Tax</strong></td>
                                    <td class="emptyrow text-right">{{isset($order_details)? $order_details['tax'].'%' : null}}</td>
                                </tr>
                                <tr>
                                    <td class="emptyrow">
                                        <a href="{{ route('biashara.order.save', $order->order_number_id) }}" class="btn btn-primary">submit</a>
                                        <a href="{{ route('biashara.order.delete', $order->order_number_id) }}" class="btn btn-danger">Delete</a>
                                        {{--<button class="btn btn-success">Update</button>--}}
                                    </td>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow text-center"><strong>Total</strong></td>
                                    <td class="emptyrow text-right">
                                        {{isset($order_details)? $order_details['total'] : null}}
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        @endif
                    </div>
                </div>
            </div>


            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-body">
                        <ul class="list-group">
                            @if(isset($order_numbers))
                            <li  class="list-group-item list-group-item-info disabled">Order Number<span class="badge">Time Created</span></li>
                                @foreach($order_numbers as $order)
                                    <a href="{{ route('biashara.order.show', $order->id) }}" class="list-group-item">
                                        {{$order->order_number}}
                                        <span class="badge">{{$order->created_at->diffForhumans()}}</span>
                                    </a>
                                @endforeach
                            @else
                                <h3>No orders</h3>
                            @endif
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
@section('script')
    <script>
        function hideSave(){
            document.getElementsByClassName("save_button").addClass("hidden");
        }
        hideSave();
        function edit_row(id)
        {
           // var price=document.getElementById("unit_price_val"+id).innerHTML;
            var quantity=document.getElementById("quantity_val"+id).innerHTML;
           // var total=document.getElementById("product_total_order_val"+id).innerHTML;

           // document.getElementById("unit_price_val"+id).innerHTML="<input type='text' id='unit_price"+id+"' value='"+price+"'>";
            document.getElementById("quantity_val"+id).innerHTML="<input type='text' id='quantity"+id+"' value='"+quantity+"'>";
           // document.getElementById("product_total_order_val"+id).innerHTML="<input type='text' id='product_total_order"+id+"' value='"+total+"'>";

            document.getElementById("edit_button"+id).style.display="none";
            document.getElementById("save_button"+id).style.display="block";
        }

        function save_row(id)
        {
            var price=document.getElementById("unit_price"+id).value;
            var quantity=document.getElementById("quantity"+id).value;
            var total=document.getElementById("product_total_order"+id).value;
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax
            ({
                type:'post',
                url:'/order/update/single/product',
                data:{
                    id:id,
                    unit_price:price,
                    quantity:quantity,
                    product_total_order:total
                },
                success:function(response) {
                    if(response=="success")
                    {
                        document.getElementById("unit_price_val"+id).innerHTML=price;
                        document.getElementById("quantity_val"+id).innerHTML=quantity;
                        document.getElementById("product_total_order_val"+id).innerHTML=total;
                        document.getElementById("edit_button"+id).style.display="block";
                        document.getElementById("save_button"+id).style.display="none";
                    }
                }
            });
        }

        function delete_row(id)
        {
            //$.ajaxSetup({
             //   headers: {
            //        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            //    }
           // });
            $.ajax
            ({
                type:'post',
                url:'/order/delete/single/product',
                data:{
                    delete_row:'delete_row',
                    id:id,
                },
                success:function(response) {
                    if(response=="success")
                    {
                        var row=document.getElementById("row"+id);
                        row.parentNode.removeChild(row);
                    }
                }
            });
        }
    </script>
   @endsection
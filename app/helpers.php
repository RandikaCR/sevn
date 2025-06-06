<?php

function priceWithCurrency($price){
    return defaultCurrency() . number_format($price, 2);
}

function defaultCurrency(){
    return 'Rs. ';
}

function dateTimeFormat($date){
    return date('d-F-Y h:i A', strtotime($date));
}

function dateFormat($date){
    return date('d-F-Y', strtotime($date));
}

function orderIdFormat($orderId){
    return str_pad($orderId, 6, '0', STR_PAD_LEFT);
}

function generalStatus($status){
    $out = [
        'text' => 'Pending',
        'class' => 'bg-warning',
    ];
    if ($status == 1){
        $out = [
            'text' => 'Active',
            'class' => 'bg-success',
        ];
    }

    return (Object)$out;
}

?>

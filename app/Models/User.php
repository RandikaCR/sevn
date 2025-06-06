<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'ref_id',
        'user_role_id',
        'first_name',
        'last_name',
        'email',
        'password',
        'phone',
        'date_of_birth',
        'image',
        'business_id',
        'public_key',
        'user_code',
        'is_email_subscribed',
        'is_phone_subscribed',
        'is_discount_available',
        'discount_rule_id',
        'profit_margin_on_sale',
        'status',
        'is_deleted',
        'deleted_by',
        'deleted_at',
        'created_by',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}

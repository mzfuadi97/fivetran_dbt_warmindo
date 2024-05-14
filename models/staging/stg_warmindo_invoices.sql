with source as (
    select *
    from {{ source('warmindo_gsheets', 'warmindo_invoices') }}
),

rename_fields as (
    select
        customer_id as cust_id,
        -- invoice_info
        invoice_id,
        tanggal_transaksi  as invoice_date,
        jenis_pembayaran,
        quantity  as qty,
        nilai_penjualan  as sub_total,
        -- product_info
        kategori_produk,
        jenis_produk,
        nama_produk,
        harga_jual,
        -- system_info
        _row,
        _fivetran_synced
from source

)

select 
    cust_id,
    invoice_id,
    invoice_date,
    jenis_pembayaran,
    kategori_produk,
    jenis_produk,
    nama_produk,
    harga_jual,
    qty,
    sub_total,
    _row,
    _fivetran_synced
from rename_fields
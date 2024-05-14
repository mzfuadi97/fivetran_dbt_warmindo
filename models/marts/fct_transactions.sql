with transaction_data as (
    select 
        cust_id,
        invoice_id,
        invoice_date,
        kategori_produk,
        jenis_produk,
        nama_produk,
        harga_jual,
        jenis_pembayaran,
        qty,
        sub_total,
        _row,
        _fivetran_synced
    from {{ ref('stg_warmindo_invoices') }}
)

select *
from transaction_data
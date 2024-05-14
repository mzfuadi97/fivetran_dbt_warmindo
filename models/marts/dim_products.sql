with raw_transaction as (
    select
        kategori_produk,
        jenis_produk,
        nama_produk,
        harga_jual,
    from {{ ref('stg_warmindo_invoices') }}
)

select distinct
    nama_produk
from raw_transaction
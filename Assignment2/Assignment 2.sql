use AP
/*
Question 1
Sum the InvoiceTotals for Vendors with InvoiceDueDates between April 1, 2015 and March 31, 2016. 
Show the VendorName and the Summed InvoiceTotals. Name the Summed column Sum_InvoiceTotal.
*/
select VendorName, sum(InvoiceTotal) as Sum_InvoiceTotal
from invoices
	join vendors 
	on vendors.vendorid = invoices.vendorid
where InvoiceDueDate between '4/1/2015' and '3/31/2016'
group by VendorName
/*
Question 2
List the VendorIds of vendors who made payments greater than the 
largest payment of firms with VendorIds of 34,35 and 83. Use a Sub-Query. Show the VendorId and payments.
*/
select vendorid, paymenttotal
from Invoices 
where PaymentTotal > (
						select max(paymenttotal)
						from invoices
						where vendorid in (34, 35, 83))
/*
Question 3
Find the state which has the most vendors with a balance due.
j alexanders
grey ghost
townhouse
hopcat
*/
select top 1 vendors.vendorstate, count(vendors.vendorid) as Deliquent_Vendors
	from Vendors
	join (select vendors.VendorId, Balance_due
		from Vendors
		join (select vendorid, (invoicetotal - PaymentTotal - CreditTotal) as Balance_due
			  from invoices
			  where (invoicetotal - PaymentTotal - CreditTotal) > 0
			  ) a
		on vendors.vendorid = a.VendorID) b
	on vendors.vendorid = b.vendorid
group by vendors.VendorState
order by Deliquent_Vendors desc
	

/*
Question 4
Continuing 3. Show the VendorId, VendorName, VendorState and balance due for that state(s).
*/
select  VendorState, vendors.VendorId, VendorName, Balance_due
	from Vendors
	join 
		(
		select vendorid, (invoicetotal - PaymentTotal - CreditTotal) as Balance_due
		from invoices
		where (invoicetotal - PaymentTotal - CreditTotal) > 0
		) a
	on vendors.vendorid = a.VendorID
group by vendorstate, vendors.vendorid, vendorname, balance_due
order by VendorState


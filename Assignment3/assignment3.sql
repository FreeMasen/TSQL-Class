use ap
/*
Write a query from the Vendors table and pull the last four digits of the Vendorphone. 
Name the column Last_Four. Also pull the Vendorname and full phone number.
*/
select VendorPhone, right(VendorPhone, 4) as last_four
from vendors


/*
Use the Case function – when then…. From the Invoices table, select the VendorID and InvoiceTotal. 
Create another column called ‘High or Low’. When the InvoiceTotal is greater than 100 then ‘High’. 
When it is less than or equal to 100, then populate your new column with ‘Low’.
*/
select VendorID, InvoiceTotal, 'High or Low' = 
	CASE 
		WHEN invoiceTotal > 100 then 'High'
		ELSE 'Low'
	END
from Invoices
/*
Write a query pulling the latest InvoiceDueDate and VendorID.
*/
select max(InvoiceDueDate) as max_date, vendorID
into #temp
from Invoices
Group by VendorID


select Invoices.VendorId, max(InvoiceDueDate)
from #temp
left join Invoices
on Invoices.InvoiceDueDate = #temp.Max_date
group by invoices.VendorID
drop table #temp
/*
If you add InvoiceNumber to the query in 3., you might not get the unique last InvoiceDueDate associated with a VendorID. Explain why.
*/
/*
Because the invoiceduedate can be the same for multiple invoices
*/
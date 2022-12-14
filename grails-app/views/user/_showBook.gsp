<div class="row px-5">
    <div class="col-md-12">
<table class="table table-striped table-hover" id="bookTable">
    <thead class="table-dark">
    <tr>

        <th><g:message code="default.book.name.label" default="Book Name"/></th>

        <th><g:message code="default.book.author.label" default="Author Name" /></th>

        <th><g:message code="default.book.language.label" default="Language" /></th>

        <th><g:message code="default.book.date.label" default="Date"/></th>

        <th><g:message code="default.button.update.label" default="Update" /></th>

        <th><g:message code="default.delete.label" default="Delete" /></th>

    </tr>
    </thead>
</table>
        </div>
        </div>
<script>

    $(document).ready(function (){
        reloadDataTable();
        $(document).on('click','#deleteBook',function (){
            var confirmation = confirm('Are you sure you want to delete this book?');
            if(confirmation == true){
                var bookId = $(this).attr('value');
                $.ajax({
                    url:"${g.createLink(controller: 'book',action: 'deleteBook')}",
                    data:{
                        bookId: bookId,
                        userId: ${userId}
                    },
                    success:function (){
                        location.reload();
                    }
                });
            }
        });
    });

function reloadDataTable(){
    $('#bookTable').DataTable({
        paging: false,
        ajax: {
            url: "${g.createLink(controller: 'book',action: 'showUserBooks')}",
            data:{
                id: ${userId}
            },
            dataType: 'json',
            // success: function (response){
            //     console.log(response)
            // }
        },
        language: {searchPlaceholder: "Search User",
        },
        autoWidth: true,
        // dom: "<'dt-toolbar'fr>t<'dt-toolbar-header'<ip>>",
        pagingType: "numbers",
        deferRender: true,
        aaSorting: [[1, "desc"]],
        columnDefs: [
            {
                targets: 0,
                render: function (row, type, val, meta) {
                    return val[0];
                }
            },
            {
                targets: 1,
                render: function (row, type, val, meta) {
                    return val[1];
                }
            },
            {
                targets: 2,
                render: function (row, type, val, meta) {
                    return val[2];
                }
            },
            {
                targets: 3,
                render: function (row, type, val, meta) {
                    return val[3];
                }
            },
            {
                targets: 4,
                render: function (row, type, val, meta){
                    var button = document.createElement("button");
                    button.setAttribute("id","updateBook");
                    button.setAttribute("class","btn btn-primary");
                    button.setAttribute("value",val[4])
                    button.innerHTML = "Update";
                    return button.outerHTML;
                }
            },
            {
                targets: 5,
                render: function (row, type, val, meta){
                    var button = document.createElement("button");
                    button.setAttribute("id","deleteBook");
                    button.setAttribute("class","btn btn-danger");
                    button.setAttribute("value",val[5])
                    button.innerHTML = "Delete";
                    return button.outerHTML;
                }
            }
        ]
    });
}
</script>
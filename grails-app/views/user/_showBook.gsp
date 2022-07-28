<table class="table" id="bookTable">
    <thead>
    <tr>

        <th><g:message code="default.book.name.label" default="Book Name"/></th>

        <th><g:message code="default.book.author.label" default="Author Name" /></th>

        <th><g:message code="default.book.language.label" default="Language" /></th>

        <th><g:message code="default.delete.label" default="Delete" /></th>

    </tr>
    </thead>
    %{--        <tbody>--}%
    %{--        <g:each in="${booklist}" status="i" var="book">--}%
    %{--            <tr>--}%

    %{--                <td>${book.bookName}</td>--}%

    %{--                <td>${book.authorName}</td>--}%

    %{--                <td>${book.language}</td>--}%

    %{--                <td><g:form url="[resource:book, action:'delete']" method="DELETE">--}%
    %{--                        <g:actionSubmit class="editButton" action="deleteBook" value="Delete Book" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
    %{--                </g:form></td>--}%

    %{--            </tr>--}%
    %{--        </g:each>--}%
    %{--        </tbody>--}%
</table>
<script>

    $(document).ready(function (){
        $(document).on('click','#deleteBook',function (){
            var bookId = $(this).attr('value');
            $.ajax({
                url:"${g.createLink(controller: 'book',action: 'deleteBook')}",
                data:{
                    id: bookId
                },
            });
        });
    });


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
                render: function (row, type, val, meta){
                    var button = document.createElement("button");
                    button.setAttribute("id","deleteBook");
                    button.setAttribute("class","btn btn-danger");
                    button.setAttribute("value",val[3])
                    button.innerHTML = "Delete";
                    return button.outerHTML;
                }
            }
        ]
    });
</script>
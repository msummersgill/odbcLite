% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Table.R
\docType{methods}
\name{odbc-tables}
\alias{odbc-tables}
\alias{dbWriteTable,OdbcConnection,character,data.frame-method}
\alias{sqlData,OdbcConnection-method}
\alias{sqlCreateTable,OdbcConnection-method}
\title{Convenience functions for reading/writing DBMS tables}
\usage{
\S4method{dbWriteTable}{OdbcConnection,character,data.frame}(conn, name, value,
  overwrite = FALSE, append = FALSE, temporary = FALSE, row.names = NA,
  field.types = NULL, ...)

\S4method{sqlData}{OdbcConnection}(con, value, row.names = NA, ...)

\S4method{sqlCreateTable}{OdbcConnection}(con, table, fields,
  field.types = NULL, row.names = NA, temporary = FALSE, ...)
}
\arguments{
\item{conn}{a \code{\linkS4class{OdbcConnection}} object, produced by
\code{\link[DBI:dbConnect]{DBI::dbConnect()}}}

\item{name}{a character string specifying a table name. Names will be
automatically quoted so you can use any sequence of characters, not
just any valid bare table name.}

\item{value}{A data.frame to write to the database.}

\item{overwrite}{Allow overwriting the destination table. Cannot be
\code{TRUE} if \code{append} is also \code{TRUE}.}

\item{append}{Allow appending to the destination table. Cannot be
\code{TRUE} if \code{overwrite} is also \code{TRUE}.}

\item{temporary}{If \code{TRUE}, will generate a temporary table statement.}

\item{row.names}{Either \code{TRUE}, \code{FALSE}, \code{NA} or a string.

If \code{TRUE}, always translate row names to a column called "row_names".
If \code{FALSE}, never translate row names. If \code{NA}, translate
rownames only if they're a character vector.

A string is equivalent to \code{TRUE}, but allows you to override the
default name.

For backward compatibility, \code{NULL} is equivalent to \code{FALSE}.}

\item{field.types}{Additional field types used to override derived types.}

\item{...}{Other arguments used by individual methods.}

\item{con}{A database connection.}

\item{table}{Name of the table. Escaped with
\code{\link[=dbQuoteIdentifier]{dbQuoteIdentifier()}}.}

\item{fields}{Either a character vector or a data frame.

A named character vector: Names are column names, values are types.
Names are escaped with \code{\link[=dbQuoteIdentifier]{dbQuoteIdentifier()}}.
Field types are unescaped.

A data frame: field types are generated using
\code{\link[=dbDataType]{dbDataType()}}.}
}
\description{
Convenience functions for reading/writing DBMS tables
}
\examples{
\dontrun{
library(DBI)
con <- dbConnect(odbc::odbc())
dbListTables(con)
dbWriteTable(con, "mtcars", mtcars, temporary = TRUE)
dbReadTable(con, "mtcars")

dbListTables(con)
dbExistsTable(con, "mtcars")

# A zero row data frame just creates a table definition.
dbWriteTable(con, "mtcars2", mtcars[0, ], temporary = TRUE)
dbReadTable(con, "mtcars2")

dbDisconnect(con)
}
}

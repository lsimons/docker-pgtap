BEGIN;
SELECT plan( 6 );

SELECT has_table( 'job_result' );

SELECT has_column( 'job_result', 'job_id' );
SELECT has_column( 'job_result', 'node' );
SELECT col_is_pk( 'job_result', Array['job_id','shape','result_name','node'] );
SELECT has_column( 'job_result', 'data' );

SELECT has_extension( 'pg_catalog', 'plpgsql', 'Should have pgsql extension' );

SELECT * FROM finish();
ROLLBACK;

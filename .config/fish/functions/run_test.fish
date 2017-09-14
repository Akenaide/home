function run_test
	export DJANGO_SETTINGS_MODULE=quesper.settings.test
ptw --runner pytest -- --last-failed --reuse-db
end

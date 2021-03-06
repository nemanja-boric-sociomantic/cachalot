# Utility library to use in scripts

apt_ver()
{
	( set +x # dissable verboseness
	pkg="$1"
	ver="$2"

	# If there is a $ver specified, then get the latest one
	ver="${ver:+$(./last-version apt "$pkg" "$ver")}"

	# If we still have a version, then pass it to apt explicitly
	echo "$pkg${ver:+=$ver}"
	)
}

gem_ver()
{
	( set +x # dissable verboseness
	pkg="$1"
	ver="$2"

	# If there is a $ver specified, then get the latest one
	ver="${ver:+$(./last-version gem "$pkg" "$ver")}"

	# If we still have a version, then pass it to apt explicitly
	echo "${ver:+--version=$ver }$pkg"
	)
}

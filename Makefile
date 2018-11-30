version := $(shell git describe --tags)
platforms = windows-amd64 linux-amd64


package: $(platforms)

clean:
						./godelw clean
						rm -rf ./out/package

$(platforms):
						./godelw build
						mkdir -p ./out/package/$(version)/$@/bin
						cp ./out/build/*/$(version)/$@/*.exe ./out/package/$(version)/$@/bin/.
						tar cvf ./out/package/nagiosfoundation-$@-$(version).tgz ./out/package/$(version)/$@/bin/*
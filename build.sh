for ver in "2.7.0"
do
  docker build -t myapiz/krakend:$ver-alpine . --build-arg KRAKEND_VERSION=$ver
  docker push myapiz/krakend:$ver-alpine
done


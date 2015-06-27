JUNIT_VERSION=3.8.1
DEP_LIBS=dep
TEST_LIBS=test

## Do not modify anything beyond this line ##
##    except you know what you are doing   ##

JUNIT_JAR=junit-${JUNIT_VERSION}.jar
JUNIT_JAR_DEST=$DEP_LIBS/$TEST_LIBS/$JUNIT_JAR

if ! [ -v JDK_HOME ]
then
   echo please set \"JDK_HOME\" environment variable
   exit 1
fi

if ! [ -d $DEP_LIBS ]
then
   echo Creating $DEP_LIBS dir
   mkdir $DEP_LIBS
fi

if ! [ -d $DEP_LIBS/$TEST_LIBS ]
then
   echo Creating $TEST_LIBS dir
   mkdir $DEP_LIBS/$TEST_LIBS
fi

if ! [ -f $JUNIT_JAR_DEST ]
then
   echo Downloading $JUNIT_JAR test dependency
   wget -q http://central.maven.org/maven2/junit/junit/$JUNIT_VERSION/$JUNIT_JAR -O $JUNIT_JAR_DEST
fi

ant -Dplatform.active=jdk -Dplatforms.jdk.home=$JDK_HOME -Dlibs.junit.classpath=$JUNIT_JAR_DEST $@

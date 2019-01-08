package utils;

import io.qameta.allure.Step;

public final class Logger {

        private Logger() {
        }

        @Step("{1}: {0}")
        public static void log(final String message, final String additionalInfo){
            System.out.println(additionalInfo+": "+message);
        }
}

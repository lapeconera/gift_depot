class Gift

    attr_accessor :login,:qna,:the_gift

    def initialize
        @security = []
        @questions = {}
        @gifts = []
    end

    def login
        s_file = File.open("security.txt","r")
        while val = s_file.gets
            @security << val.chomp
        end
        s_file.close
        i = 1
        while i <= 4
            print "** Please enter your username and password"
            puts "\n"
            puts "\n"
            if i > 1
                print "Attempt #{i}/3"
                puts "\n"
                puts "\n"
            end
            puts "Username required"
            u_name = gets.chomp
            puts "\n"
            puts "Password required"
            pass = gets.chomp
            puts "\n"
            i += 1
            if u_name == @security[0] and pass == @security[1]
                #true
                puts "welcome #{@security[0]}, how are you today?"
                qna

            elsif i >= 4
                # security question needed
                print "Please answer your security your first question"
                puts "\n"
                puts "\n"
                print @security[2]
                puts "\n"
                puts "\n"
                puts "Enter your answer"
                a1 = gets.chomp
                if a1 == @security[3]
                    print "Please answer your security your second question"
                    puts "\n"
                    puts "\n"
                    print @security[4]
                    puts "\n"
                    puts "\n"
                    puts "Enter your answer"
                    a2 = gets.chomp
                    if a2 == @security[5]
                        puts "\n"
                        puts "\n"
                        puts "
                                /()()()\\\\
                        =======()()()()()\\\\\
                            ()           \\\\\\\
                            ()(*)    _/      \\\\\\\
                            \    /  \      \\\\\\________________
                                |  |   |       </                  ()\\\\
                                o_|   /        /                      \ \\\\    \\\\\\\
                                    |  ._    (                        \ \\\\\\\\\\\\\\\\
                                    | /                       /       /    \\\\\\\     \\
                            .______/\/     /                 /       /         \\\
                            / __.____/    _/         ________()       /\
                        / / / ________/`---------`         \     /  \_
                        / /  \ \                             \   \ \_  \
                        ( <    \ \                             >  /    \ \
                        \/      \\_                          / /       > )
                                \_|                        / /       / /
                                                            _//       _//
                                                        /_|       /_|"
                        print "reCAPTCHA Robot? #{@security[6]}"
                        puts "\n"
                        puts "\n"
                        puts "Enter your answer"
                        a3 = gets.chomp
                        if a3 == @security[7]
                            #true
                            puts "welcome #{@security[0]}, how are you today?"
                            qna
                        else
                            puts "Goodbye"
                            exit
                        end
                    else
                        puts "Goodbye"
                        exit
                    end
                else
                    puts "Goodbye"
                        exit
                end                
            end      
        end
    end

    def qna
        q_file = File.open("questions.txt","r")
        while q_val = q_file.gets
            x = q_val.chomp
            spl = x.split(',')
            @questions[spl[0]] = spl[1]
        end
        q_file.close
        #question 1
        puts "\n"
        puts "\n"
        puts @questions['q1']
        puts "\n"
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a1']
        answer1 = gets.chomp
        ad1 = "a_#{answer1}"
        a1 = @questions[ad1]
        #question2
        puts @questions['q2']
        puts "\n"
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a2']
        answer2 = gets.chomp
        ad2 = "b_#{answer2}"
        a2 = @questions[ad2]
        #question3
        puts @questions['q3']
        puts "\n"
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a3']
        answer3 = gets.chomp
        ad3= "c_#{answer3}"
        a3 = @questions[ad3]
        answers = [a1,a2,a3]
        the_gift(answers)
    end

    def the_gift(arr_answers)
        #loop and string reference
        g_file = File.open("gifts.txt","r")
        while g_val = g_file.gets
            @gifts << g_val.chomp
        end
        g_file.close
        #break gifts array into individual arrays
        gifts_length = @gifts.length
        @gifts.map! do |v|
            v.split(',')
        end
        a = 0
        x = 0
        while a < gifts_length
            arr_answers.each do |a_val|
                if @gifts[a][1..5].include? a_val
                    @gifts[a][10] = @gifts[a][10].to_i + 1
                end
            end
            a += 1
        end
       p @gifts[0][10]
        



    end

end
prompt = Gift.new
# prompt.login
an_test = ["logic","rich","lover","lover","lover","lover"]
prompt.the_gift(an_test)
# this will never end else control c
# puts "\n"
# puts "\n"
# print "Welcome to the GIFT DEPOT"
# puts "\n"
# puts "\n"

# a1 b1 c1
# a2 b1 c1
# a3 b1 c1
# a1 b2 c1
# a1 b2 c2
# a1 b2 c3

# ########################end#############################
# #r.sickle@protonmail.com

# each answer has hash with keys and values

# store all answers in a single array

# each gift has an array with values "string reference"

# #loop through and match array with answers against the gift array 

# sum each gift into a variable g1 g2 g3 g4 g5




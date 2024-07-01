import 'package:exam_prep_tool/app/modules/faq_screen/views/faqmodal.dart';
import 'package:get/get.dart';

class FaqScreenController extends GetxController {
  var accordionItems = <AccordionItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAccordionData();
  }

  void loadAccordionData() {
    final data = [
      AccordionItem(
        id: 1,
        title: "WHAT IS EPT?",
        answer:
            "ExamPrepTool (EPT) is a educational platform which connects students and teachers from across the world and brings them to a common platform in order to facilitate a friendly and seamless interaction. It allows teachers to impart their valuable knowledge simultaneously making them earn in their free times. Students can also be benefitted by getting their queries resolved instantly.",
      ),
      AccordionItem(
        id: 2,
        title: "HOW IS IT USEFUL FOR STUDENTS?",
        answer:
            "EPT will be useful to students in many ways\n1. Students can get clarification of their doubts instantly by experts across all over the world\n2. Students can get assistance from toppers videos, important questions and notes.\n3. EPT is also useful for students to get career guidance and counselling by experts across the world.",
      ),
      AccordionItem(
        id: 3,
        title: "HOW TO USE THIS APP FOR STUDENTS? (VIDEO TUTORIAL)",
        answer: "",
        screen: "https://www.youtube.com/embed/K_QFRRdZ8Xs",
      ),
      AccordionItem(
        id: 4,
        title: "WHAT IF MY QUERY IS NOT RESOLVED?",
        answer:
            "If your feedback is not good then it will be considered as a dispute and our team will verify by looking into your chat, based on chat we will try to refund.",
      ),
      AccordionItem(
        id: 5,
        title: "DO WE HAVE STUDY RESOURCES?",
        answer:
            "We have toppers notes, toppers videos and toppers important questions.",
      ),
      AccordionItem(
        id: 6,
        title: "DO WE HAVE A MENTORSHIP PROGRAM?",
        answer:
            "Yes we have, students can take career counselling and guidance from experts across the world.",
      ),
      AccordionItem(
        id: 7,
        title: "Is there a facility to clear doubts?",
        answer:
            "At EPT teaching pedagogy is very effective and easy to understand. Highly experienced and renowned faculties will teach all the subjects; hence, the chances of doubt are minimal. However, every session has CHAT FACILITY, wherein the students can raise their doubts to the concerned faculty; these doubts will be addressed within 24 hours (subject to the availability of the faculty).",
      ),
      AccordionItem(
        id: 8,
        title: "IS THERE ANY REFERRAL OPTION AVAILABLE?",
        answer: "As of now no, soon it will be there.",
      ),
      AccordionItem(
        id: 9,
        title: "HOW WILL STUDENTS PAY? (MODE OF PAYMENT)",
        answer: "Mobile wallet, Bank Transfer, Net Banking",
      ),
      AccordionItem(
        id: 10,
        title: "ONLY ANDROID OR IOS APP ALSO",
        answer: "iOS App under development , soon it will be in Apple Store",
      ),
      AccordionItem(
        id: 11,
        title: "For any query how to contact?",
        answer: "For any query , Feel free to whatsapp at 8879045526",
      ),
      AccordionItem(
        id: 12,
        title: "Is the mentioned price a yearly fee or monthly fee?",
        answer: "Mentioned price is one time fee.",
      ),
      AccordionItem(
        id: 13,
        title: "Classes will be live or recorded?",
        answer:
            "Classes will be Live & recorded both ( Students can see the recorded version of the live class anytime if he/she misses the class )",
      ),
      AccordionItem(
        id: 14,
        title: "Till when can I access the batch?",
        answer: "Till the course validity .",
      ),
      AccordionItem(
        id: 15,
        title:
            "What if I have missed a live lecture and want to watch the previous recorded lectures?",
        answer:
            "You can watch the previous lecture anytime in the recorded format.",
      ),
      AccordionItem(
        id: 16,
        title: "Can I get a refund after batch purchase?",
        answer:
            "Dear student, refund after batch purchase is not allowed as we have already invested a lot in providing the best learning experience to our loving students in terms of tech infrastructure, employee salary etc. Please make a conscious decision before purchasing a batch.",
      ),
      AccordionItem(
        id: 17,
        title: "What are class Timings?",
        answer:
            "Morning & Evening in week days & doubt solving & weekly test on Saturday / sunday.",
      ),
      AccordionItem(
        id: 18,
        title: "Which online courses are offered by EPT?",
        answer:
            "EPT offers courses related to Computer Science includes GATE CSE, GATE DA, DSA , Programming languages , Mentorship Program, PSU exam and many more. For more details , You can visit our courses.",
      ),
      AccordionItem(
        id: 19,
        title:
            "Can I login and watch the videos on my laptop and sometimes on my phone?",
        answer:
            "It is possible for you to change the device. Nevertheless, you can only watch the videos on a single device—a laptop, tablet, smartphone, etc.—at once.",
      ),
      AccordionItem(
        id: 20,
        title: "Is there any refund policy?",
        answer: "Online courses are non-refundable and non-transferable.",
      ),
      AccordionItem(
        id: 21,
        title:
            "What are the do's and don'ts for the students during an online live class?",
        answer:
            "During the live online classes, we want students to behave appropriately and use the chat system wisely. If a student engages in inappropriate behavior or uses offensive language in chat, their course account will be blocked right away. Because of the student's inappropriate behavior, EPT maintains the authority to permanently prohibit them from the course.",
      ),
      AccordionItem(
        id: 22,
        title: "Will I get internship Certificate?",
        answer: "Yes.",
      ),
    ];

    accordionItems.assignAll(data);
  }
}

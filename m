Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1D15679F
	for <lists+cocci@lfdr.de>; Sat,  8 Feb 2020 20:44:51 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 018JiU5s015937;
	Sat, 8 Feb 2020 20:44:30 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CAA2F77FC;
	Sat,  8 Feb 2020 20:44:30 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8A0BC7718
 for <cocci@systeme.lip6.fr>; Sat,  8 Feb 2020 20:44:28 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 018JiRNJ000388
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 8 Feb 2020 20:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581191066;
 bh=6dFKlLCDaPwT9dYGCnPnw95W4f/E2lbdF7FyyeRO8ks=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=HehxA+EI8B4vPBZXriqGqhJAQU7RAmyH/urC3iP0TD1TLSCj5durlsFWjNmkG75F7
 tubGOJnYZxVU2oThuw5YQBjnGePJfm3cSlCoSawpH34FtM2Wsy4CC/4M0jNP7ZyM7r
 V9B89inkgqsANFs24ZWYpAP+EfBAtGPmr/yagYtQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.138.97]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LdVdS-1jQX7Y1XwQ-00ionr; Sat, 08
 Feb 2020 20:44:26 +0100
To: =?UTF-8?B?T25kxZllaiBTdXLDvQ==?= <ondrej@sury.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <beddf327-4b09-16fa-f011-ae14c20e988b@web.de>
Date: Sat, 8 Feb 2020 20:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:I6FKaRLittNgand9iy32wv7CkeVENB21GNeyR60x73zD1ddkQpR
 MlRlIP2TPXgJHOPnmPNaM00oghJPc2+ZzuZPyxbYrnGFhC/RFvDD7krfZbUOrO+aO6CZZ4J
 hEe6OSZ9TLRVJ/f9xovRyPtCYCeYkM3qxUaswgL2ACZX24XE58uNvBQLmdem8f8WfAjpQ2h
 +QGLPx7ZSTiEoSWlEUcKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TFbhxxr1Zxs=:yyoDsslMl/Wu7qnolFLbjc
 qCG1ovck+iE90T/ErI+Bcs/+xlEeMgX2iefkETlOpHfeco2czqIuafvHQyD+0XE2QeqQxclIz
 kVqAr6yI/fL/64+Kzcmti0QqOsMSx0QSn9w+9lojCpu8noEIyZXHVZSBByJ1uxKesom0RehVu
 NOPGlZ9IH4Su9VRyJGwZjzFhPcz4bduS7xeYHRxwMCu1wUlGswH6u9kOcuZZS3ojcEjmi2fXv
 dyiewDnDkijiKzZyIPoxQmkum+u0/IqZDj9IbjvAWyf/XNhOP+QkSQEOvk2yKwScBwpa97wTU
 d6OlgsBRSfscI7/MdhcVMR8J4IGMO+Rdsy14MeAY3Y8traCCYQnQn/pDfrk0+VFnnOmiXEN3G
 7UW7dXqSxrwuw1Po+oA8aI0G9GCFIskvQ/hAEF9nrmA7mrEXC1lkvJOjutV61WgEgsAy6TMrT
 VVUxSBouvx0j3OQSECOYs09q9BGh9XWUgDj7MyK8r3COHjdyEJGxeg17cx85tHlQCvv51t+9B
 um5GnVNB/N2W6nM6d4kQrs6ZhyJ34vvQUGyNmgms4waygtmoiNkGUzRiW9/GfkOnbPxLF+knw
 aOdNGebnG8KUeWZdhFvDm0km+gZJnF0ipeJAVuzAViUNtH+1c768Vf8YP+XDtHzT53mY5PrM0
 XNzhV4MUxkVR0IKcs5PXMXUYRIGePaua4UC6pdeCueuneeXoAsVzt94hOzWjLm54Fwhf8Wm5R
 JEZQ3IJK8tZokXdrYfea0VzeRUa/vEdWJd+wY1gjEyR0aoCb4IZYro6heayOBIuEDcsPIci0M
 QBe1/AolkidQem1yF0INBsW4CCJiOwkmpji4jZt6DJOVyMoAb+pqzmYFszqFwLM+E9zBAsVJO
 cdMZ9mBMgPV/YUUfvwDRNUPLrx1yN+i2ew2BCUsJ1zSgEr1PlwpHiZnxKpc62/fzgbl/4VXuE
 dlm6yJiVHIf0YYkRyANvP9oIbypmUMWt7Xhzajcib+qUoARSsCgKZCMjuJhRSVbh9iD6OFEWf
 QqeoQjRK1N0iVyV96Pmn8ecpMRsbXDe1rFbuEzYwiOVZklJLPFPzY4A+7BUAJsfY9YABf1GkJ
 7WVQhNlea0SMEeAoQ4ogumuFr6Q8HJYUDF/Jrk73GZX2tlgRSMQQ1sQb3TtRnH4oRysf8m+Sw
 5dohwCV3ttpjkoART+DYKZjVE6q3SjRLIjHwOVW915L4tQBQ8N+L9yzWu9fHB4EtWZfmCuGNh
 DZ7eR3/MdJ6fg6ZoE
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 08 Feb 2020 20:44:32 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 08 Feb 2020 20:44:27 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Replacing the type casting
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Can the following transformation variants be also helpful?


> @@
> type T;
> expression source;
> @@
>
> - REQUIRE(((T *)source) != NULL);
> + REQUIRE(source != NULL);

 REQUIRE((
-         (T*)
          source) != NULL);


> @@
> type T;
> type R;

type T;


> identifier common, rdtype;
> T *target;
> expression source;

typedef dns_rdatacommon_t;


> @@
>
>   REQUIRE(source != NULL);
>   ...
>   REQUIRE((
> - (T *)
> + (dns_rdatacommon_t *)

 (
-T
+dns_rdatacommon_t
 *)


Will any constraints become relevant for the deleted data types?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

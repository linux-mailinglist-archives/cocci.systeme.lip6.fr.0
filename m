Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557FF156448
	for <lists+cocci@lfdr.de>; Sat,  8 Feb 2020 13:56:38 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 018CuGxv017769;
	Sat, 8 Feb 2020 13:56:16 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F1E957718;
	Sat,  8 Feb 2020 13:56:15 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BD3047718
 for <cocci@systeme.lip6.fr>; Sat,  8 Feb 2020 13:56:13 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 018CuBcg021967
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 8 Feb 2020 13:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581166569;
 bh=eFCp2ZsXl5GRe+rQacu2867+/eGHHb03YJdq+3z6aNc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=P45lKxD8k1KXixXRq9z483mnBxkwSX+O8GLtVNS0pv6atfnPLzkQduPcoKFdpgo+X
 U8CP/bodENU1yq3khxIo8Kk19WheLqmie7AfZ3AXpZiYG7rCI13gUhbzseqA59UQbW
 GI0jEcoJUhE3wyEQKyTU6JIwoV4X45+gx0nhvITY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.138.97]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbMg8-1jGyZJ0tYi-00Ihmm; Sat, 08
 Feb 2020 13:56:09 +0100
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
References: <88e09c8a-e39f-2722-9f87-333d2c14a7a2@web.de>
 <6f51f690d06cdd2278900480bd079cd90895ec43.camel@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b9326209-584f-7d76-97f8-d44eff49d9c3@web.de>
Date: Sat, 8 Feb 2020 13:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6f51f690d06cdd2278900480bd079cd90895ec43.camel@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:XYxnJhUw4P/7uRiR/SHHkCufBCopufO9gSkAwpZJaBTazCx5awq
 VuNgqgqFkNAtVhtyURbiVANiRUJAShGZsvdlzqEzxUg7kbJTpuZMPcXWUi1syB7PutBVkjv
 SYCWhPQ59CtfsWOnD07HJKhJLKVYK4lZIBpj9O8QhjZgrLrQXVNKnpJbJBXPqRSqZqAbOHc
 J2yXQ8uO+oovi+M977WDg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jmFWy0171v4=:WnyiwCWrBO5Knys1bX35Yx
 hOICgWhlI9V3t0Y6lvVr8PUnONrAXYn81rIyddVJpb0Umabx6Lf8Ngu5T1PmYYJreJTMslrxz
 F+XnBMgGV+wxUQsaQv7rZwAHeEn1P03TVC8sD+bvwEMxsvx9H1c5FbsvxHd9dJk+jFnC3UNsU
 p5rPAsCFWTVQeFSdVYDtJ6zZwnRdyVMSVHfMQdYi+rLYXpjHHf+3EnMKASim+tLCMxz3t8bqb
 LCiLxpMb6ncdWbXl0iR5TpDlNY8+ggl1IGsI2HwDRPmVo63GSff9mppnnZtarMG0n4iG5TmkY
 bHyylHmQefMR9lMlvq9IGcmL1ZsNjMd3OTWigajQgm5SiP0jVRJ7oxWh1ZiAdp/Flp0GbWHbt
 s73650jYLZJ59oNkUJSnq3X9/HotIgB5FJV+DfUkZ5wPxt7/G+VtADC/QusVBP9i7F2RWgy/6
 4p/L+vN3DR2G1Vfmm1KKqxkgVNC7UXBir67Pd32LrQZCeZOIexKYGxdstFZmPppKmvx+MjXQE
 zqSQYispozemNBvJ0a6h7+F9llv+tP2p7+pKtQ9qxzi+l/DvR3OfqamVNPRIgsIu+veWbGkKp
 xKtEkKvC39xynUOyrLlvtleeHfe2LSMCecD/cvF6ufbcwcc2tgB5cNchtGLqRuNZaeIOeofQb
 uzHZ1MbrTuUUJ1zwDyFi5rm5m8TAJZSuIjFmKE7oDlQ1TZQU+lXq5Ve3x4FZYOjoYyOMeghV6
 9TKaFaM76uExnxbDK0aftge3Iyx2nfEviKp7ixwQwmSSIDv58Bvcwr0592dy6pQH8Wlm6NfP8
 ij4nOKo6jWWa/75HjptE4Gu4lxTpUihftoveFsW1gFGCTCSauwQXvYL5gzHgHaQ3xLCZfzoZ7
 i0jlfOeLgq8O3sC/QoIiZ0ZvbKFhrmN2JYotpZPyXeDIrRKHIH8VhTTEo5VZX+dCN6BhUQbxU
 /AA5ekmPHoiLpOYluE3ZcF5D12CV8R1ZeGhV9wTDoYeWOQaOeMwLj3ejQiUjsop+yAva9zmYd
 hAFidELL7Hf6qSLd3kkZ1W4/dA6AVU7hSbit76+OzhBL94mLCO+Tjd1GJkw/MBBoovmFAhp4Y
 BZNbr/sVU7RimfINqc2M0aXIUJhqfOrrcD9DYd3hHg8h1o+aqf0hPZDLwPGMeGw35oax7ZpVF
 A+3riRm/6Alu+yyIWD+2/V8XY0g5NUVN80cetPTIk0XdQAnPM0ZH4dja+wFdYchVvJaYqJUW4
 m+MOWhMl1MfuVcoc9
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 08 Feb 2020 13:56:16 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 08 Feb 2020 13:56:11 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cocci] Linux dev-tools: Handling complex types and attributes
 in Coccinelle
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

> A little collection of scripts/tools I've written[1],

Thanks for your link on another bit of background information.
https://github.com/jajajasalu2/cocci-type-test-suite

Would you like to point any related information sources out?


> and the invaluable OCaml debugger :)

This development tool can help occasionally.


I am curious if your contributions will influence also other known open issues
for this software in positive ways.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

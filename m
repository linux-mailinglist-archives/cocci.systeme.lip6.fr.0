Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8BB1136
	for <lists+cocci@lfdr.de>; Thu, 12 Sep 2019 16:33:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CEXERp016201;
	Thu, 12 Sep 2019 16:33:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B8C8C77B2;
	Thu, 12 Sep 2019 16:33:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D813B7797
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 16:33:12 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8CEXCPa024976
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 16:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568298791;
 bh=AtI27DjKuVWgbASlNR4o2nfy3dTJLaFArJ6BDsfIniM=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=scSPwiig9VIDsra/i5IVln08dOdafPPWmnVvqLWvo4LYAQ4XYenrc/5+ONt8Sfetq
 ibVRC9GgVLN5QsOB87A6acvBE4B01XJhdFT7IaFvFDfiDDKJVwlNBaiIKttVkHS8GM
 OpWyNU7M3v8tvq5GFMX0zoqNrwVF8Y2XT8lCZrEk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.130.119]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtWo4-1iIQ5L1u0C-010wPW; Thu, 12
 Sep 2019 16:33:11 +0200
References: <20190912123435.ztwsymd7m4s4n6hq@gintonic.linbit>
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9ba987e2-c6a2-cf6a-5a94-8bf841a6e195@web.de>
Date: Thu, 12 Sep 2019 16:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190912123435.ztwsymd7m4s4n6hq@gintonic.linbit>
Content-Language: en-US
X-Provags-ID: V03:K1:CzyYnq7N1kuUhRv9GNU+Vea8u/XZs5gFyM3XtU/zTRXcAl7FZpS
 uV+BIOdNRx78dejDOm1mKGHhlo1tBUaCNqN6H27z63W73ioDEkznyqWNxiHWk5fPBdJgYLS
 RM46dYEmxKmE9swrVqE3N4lfWGI0clZGzTKEETe6e/tqdcWxphMehs+D2YPMh2tjXjHx4EJ
 nrJB1ooSjGWSQPja7X0FA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjgzPtkBnXI=:jJygLXbNzvFIVjv4Lii2am
 GGsAIipD5cUOJsLsIp3rory2Flp96l++B2sbC/7brn3EXR3k/2XOJ+V35p/fThuIlNaMfQOwn
 150+dSV/X+uqFkelnQkpoOjfuzoQIOLArTKXC0RWm8tDaj81OKNkdomy9TgosLLiNwvwa1u+H
 RzHwHHPDpZOINo7Txz1caaxYfOp7+BBBuuGTDdbfnGmAe9+CLbGiAt2YY5f8D6vsY0w9iOurw
 HCFxNjVbx3kIocmaZUEPMtEGKA/3S66ioSnGEmiUoZCWi72n0oOAo0BRszL1XJb46nKoCYbEm
 xSl+G4CIBWrcK+S9i98oJo4drSzWssAJw2WvXcVU7vhn52rnMefWyYUK6V0MXQOyOHZ+KDl47
 IlEr7xS3jv5eH2BLhgxRLamM6kIsHn5+uRRDHpFhV/bGtFkdLt+Fa7cFz9LVnGhXHeH6W0Qjt
 l0uNcSb9HU7H3SDys0TBI7GxBcarMAgd/Ybe1F3vOi+aOBqyzmYAiKLNFPyRCOlfgSncmH4lR
 6vUa7zbrqZrplV07FvslDkN0NnyukJS3YnHTb/EwP+8lChqDc0R6a0Pthoa6NXgGIkuYCEpDR
 hAxvY69vZIlF/rhFZC4QlseGqKiwagxVukFG5IhHOfu1CfeMBWVPTxagFV8WhsGUtyINRfzZ7
 W0O+1cA9iIU+AeKB/+oPy3EtuKWGzGS77a3xSwg0QFJu/93MpNSU7RoSNB1P4nR47VXpq+k9h
 wMUwo1dvleZxJi0pSQbKVU/bCqd+RJab7b1cet+zNu3FdpKxhKZMuRjOgVZHmmOCCfFqXGVR9
 y/CF5FR8rUkf+T7hb3fH7pJEGxK8HS3iFa+7nmWkKACg+x75itLuJ9fdYL7tKM163yM37ngY6
 FuY06ZsPyWpJyUuItjB/v0I66+lBPeWf3jSMEcu+NKv0lRAtCaCeVDmXks7msaF2ABv/cweM0
 IyyASfGRfVYf7seJDpbIo/HGoQY7F9I6XVntwwVsHmj4/9tEEMmVknb4fAZlfjfTsIEsTIvJA
 vNClS28LVYAHIny5K2KhpqSuwWFnRzG589WUr9c27ZQG5MOFxhVxpkHPaGO6qYBztT4bNByFh
 pAGiHhIxsM8P1smpR/GDi54eMS+RE58nCmAxb9Xwlti4fuYyDYcjF9HgL2jSEQp+3mRI/v5bX
 hbVQ0L3n8SIF9GUAG3u41sQFoyLXUr5pmmy5bK/fOEmAqBefxqQAMCMwU+9jnAvsMx0wWI4pm
 cZoHHnJPn9Y1DDJYtcCOvyjinHorOqpCYS2sttiv3nG/Mw/JpfofL3B3wwv0=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 12 Sep 2019 16:33:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 12 Sep 2019 16:33:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] const in parameter lists
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

> drbd_submit_peer_request(...
> -    , const unsigned op, const unsigned op_flags
> +    , const unsigned rw
>  ,...)
> {
> ...
> }

How do you think about the following SmPL change specification?

 drbd_submit_peer_request(...,
-                         const unsigned op,
                          const unsigned
-                                        op_flags
+                                        rw
                          , ...)
 {
 ...
 }


Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A8ED71CD
	for <lists+cocci@lfdr.de>; Tue, 15 Oct 2019 11:08:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F97nIX024493;
	Tue, 15 Oct 2019 11:07:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8317777C3;
	Tue, 15 Oct 2019 11:07:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9813A44B2
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 11:07:47 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F97kCx021510;
 Tue, 15 Oct 2019 11:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1571130462;
 bh=GwVunBu1vsjaBi85nYfZQ9Us0JlzlLAwNgogvSiXNr4=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=bRA35zHxCzbVM9jtzQAKx/+/nyvARbKVOJg0I7f/IyJLkPDM6Gu3XHvbMWuJG46eO
 wFaGcAUDUNW5UJcPKFYLgjUsNYeMf3+46hYNNrviZppwFwSFXMntMzidPqYpJRi6R8
 evPaZgiDIG7G1IvXTklERHBwP4q5IJMDqd92eBSY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.79.11]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LjJK3-1hmKh703hP-00dVZ6; Tue, 15
 Oct 2019 11:07:42 +0200
To: Julia Lawall <julia.lawall@lip6.fr>,
        =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <56102ab5-b633-7e14-1fd3-3f43fb0770b9@web.de>
 <alpine.DEB.2.21.1910141740580.2330@hadrien>
 <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
 <alpine.DEB.2.21.1910151004110.3774@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <2ee21d10-db6e-901d-9b47-697ea6a9b877@web.de>
Date: Tue, 15 Oct 2019 11:07:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910151004110.3774@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:CSl6Ad7ywQSIaKzXRJlZRcFTnuLE006ixAi5Yv8DnuvaN1c7eYD
 bHLWF5rRVsVGvBMXa6VH4Y8jUpmOitdtRTKNXJj5GQ9mwFE1sEzEGdpqvpUkrOJnrAWVVxc
 lrNaF1lU2r0bifsrsHOFLyrEZkiU5kkBjDqRCvAV/nK2aGXJjEK0m8aOlyJHl9I2832aKap
 uuWuk1mB0FfYRnJ0Ov7iA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QsPMUwQg8yY=:8BaQlT4u6mSnlyv5F0Uujj
 lOlvVPUMjgLtU58zpvZ55TYKmv1QuEdBWspCvZbIjxyC2Ytlbsy9P21sfcRZ24mShZlIw77B+
 IkRoTqhgMEmg134kcIfxwhGMYi1PoUBJRdTdVF530NpaEoNbMD5m6jZ8LAQs+95x0tgVdygTb
 lT3CkNxsSr3w1CqTkgOzlpASMbcmIfTdipxhJsyw7TBQx9plE6svJZgYFGTLX46QHcIG+9l0p
 7Nyijf4RYgOi1431BHyT9KuNmGNvZS3Q5+5bxM5sbAOH8e7da+W6eIjnvIDIk6j/NbV4pgwk3
 ea90C5gGtL+/7b2PE5BQ3KSY0sWISztkJ7UEA2vvODR3uvDhGHfkHLT5mqI6+RKJMDiblVixQ
 D2TdgG2t+RX1j+g/FRt5rEwS+e4335/m0R1SYctvczpKD2Go8hwnKL+50pyplULKFvMP3nZKG
 EufiLCSC89Xi4mFHF6zryqDNu0BOu6lQVxCiXy/R4/GBoCjc8VrikoGrYFVL6T+4vBjHKan15
 Jj9OcbXwyMUjJn8eQpbLQILxqQuJnGSWod3fr2yWX7mk+mf3pllABxaPQofMkU2IsimBdO3u7
 Pmlu5E1TzTJeCYMJm4XuzTQs10rpGQWU1WxMEzwhFluq/EhcS/FSVH1yP/fNIfFsHKePsnUuT
 D47VLKGCz8YBsLTV+ahOoR5j1SF4wu+0HP3GeTeVYz9wNTbM5xfYT4U1nhzjE34go9+Uh/d3G
 DTK2xMFQtGKJaOaDgrk7fcyC3B7FRkn6KyTXsBdSuczSjM+Ypye3E+gU8lkBRwJEBw33NJ9++
 kzS9FpPwMd2zAAOXvRRvobeklu9SFW50nFFw1YT7eLfN18ZNqSbsDXMD67AH+n3jsFXpRYg1M
 LAXRhk1QQDAIg8fiE0X52CF54kw6uIlJGnxWTE5pn6qj1mdya2C+waUwRt3l7ScLWgKy+aoiT
 WpLEZmYeQGNdGYWqzRVNF3L2ICvByhBp/r++G6d3dHBKbqjcXfO/ILTgqWeO8vOkKse/6BVrN
 vGLmVNQaONA+wBql8hPnz5k8zTlpZMQq1e4K6lTUCq/4yDSVb3igg8EQZlxdHr1SVThVguvtm
 faIHkBRjODa7UiZmWgVyrVwIbIxONfvyowC2YVfPsdoPis25J0wY+6853VNNWKIS4AoElg358
 TCjqO8nFAGPaTF7kn4bHhVrfr/xuyo+NsK1/UiRQ/uhxIxSw+SteDMDOdEoo3horY0UZtavcX
 J62ZzcrDyLsZhB7FvSGrRW4UNpTwWe2DBdHZEOuSaE2pQFnCDZF6JcrDw5UU=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 11:07:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 11:07:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] macro parameters and expressions?
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

>> BAD:!!!!! #define MACRO(name)    snprintf(pg, PAGE_SIZE, %u\n", ptr->name)
>
> If a " is missing then the code can't be parsed and Coccinelle won't do anything.

I suggest to take additional software improvement opportunities into account.

Should a semantic patch language script become able to fix such questionable source code?

See also:
Add a metavariable for the handling of source code
https://github.com/coccinelle/coccinelle/issues/140


Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

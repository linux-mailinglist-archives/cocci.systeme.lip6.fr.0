Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB6B155295
	for <lists+cocci@lfdr.de>; Fri,  7 Feb 2020 07:48:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0176mW4m016706;
	Fri, 7 Feb 2020 07:48:32 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8464C77FB;
	Fri,  7 Feb 2020 07:48:32 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9C242772B
 for <cocci@systeme.lip6.fr>; Fri,  7 Feb 2020 07:48:30 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0176mSC4008065
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 7 Feb 2020 07:48:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,412,1574118000"; d="scan'208";a="338361646"
Received: from arennes-656-1-381-165.w90-32.abo.wanadoo.fr (HELO hadrien)
 ([90.32.253.165])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 07:48:23 +0100
Date: Fri, 7 Feb 2020 07:48:22 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Pan Nengyuan <pannengyuan@huawei.com>
In-Reply-To: <33151da0-3414-a1de-5828-58fc89d77390@huawei.com>
Message-ID: <alpine.DEB.2.21.2002070746330.2281@hadrien>
References: <33151da0-3414-a1de-5828-58fc89d77390@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 07 Feb 2020 07:48:32 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 07 Feb 2020 07:48:28 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kuhn.chenqun@huawei.com, cocci@systeme.lip6.fr
Subject: Re: [Cocci] Q: does spatch understand g_autoptr/g_autofree?
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



On Fri, 7 Feb 2020, Pan Nengyuan wrote:

> Hello,
>
> I have an example:
>
>     @@ expression d,p; @@
>
>     - g_autoptr(d) p;
>     + g_autoptr(d) p = NULL;
>
> C source code:
>
>     void f(void)
>     {
>         g_autoptr(Test) *p1;
>     }
>
> Then I got this error:
> minus: parse error:
>   File "test.cocci", line 3, column 15, charpos = 38
>   around = 'p',
>   whole content = - g_autoptr(d) p;
>
>
> is it correct?

No, Coccinelle knows nothing about these things.  If you don't care about
the types of these variables, you can extend standard.h to say

#define g_autoptr(x) int

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

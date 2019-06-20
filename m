Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A254DA05
	for <lists+cocci@lfdr.de>; Thu, 20 Jun 2019 21:13:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5KJCMP6018626;
	Thu, 20 Jun 2019 21:12:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3782E778C;
	Thu, 20 Jun 2019 21:12:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 24F607778
 for <cocci@systeme.lip6.fr>; Thu, 20 Jun 2019 21:12:21 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5KJCKX0000010
 for <cocci@systeme.lip6.fr>; Thu, 20 Jun 2019 21:12:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,397,1557180000"; d="scan'208";a="388396700"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 21:12:20 +0200
Date: Thu, 20 Jun 2019 21:12:20 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
Message-ID: <alpine.DEB.2.21.1906202110310.3087@hadrien>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 20 Jun 2019 21:12:22 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 20 Jun 2019 21:12:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>,
        LKML <linux-kernel@vger.kernel.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Coccinelle: Add a SmPL script for the reconsideration
 of redundant dev_err() calls
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



On Thu, 20 Jun 2019, Markus Elfring wrote:

> >> +@display depends on context@
> >> +expression e;
> >> +@@
> >> + e = devm_ioremap_resource(...);
> >> + if (IS_ERR(e))
> >> + {
> >> +*   dev_err(...);
> >> +    return (...);
> >> + }
> >
> > Why do you assume that there is exactly one dev_err and one return after
> > the test?
>
> I propose to start with the addition of a simple source code search pattern.
> Would you prefer to clarify a more advanced approach?

I think that something like

if (IS_ERR(e))
{
<+...
*dev_err(...)
...+>
}

would be more appropriate.  Whether there is a return or not doesn't
really matter.

>
>
> >> +@script:python to_do depends on org@
> >> +p << or.p;
> >> +@@
> >> +coccilib.org.print_todo(p[0],
> >> +                        "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
> >
> > "the previously called function" would be better as "devm_ioremap_resource".
>
> Would you like to get the relevant function name dynamically determined?

I have no idea what you consider "the relevant function name" to be.  If
it is always devm_ioremap_resource then it would seem that it does not
need to be dynamically determined.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

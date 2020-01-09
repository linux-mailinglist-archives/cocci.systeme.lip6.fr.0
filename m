Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6588A135908
	for <lists+cocci@lfdr.de>; Thu,  9 Jan 2020 13:18:00 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 009CHlge027056;
	Thu, 9 Jan 2020 13:17:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C14F377EA;
	Thu,  9 Jan 2020 13:17:47 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E607D77DB
 for <cocci@systeme.lip6.fr>; Thu,  9 Jan 2020 13:17:45 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 009CHiqx001586
 for <cocci@systeme.lip6.fr>; Thu, 9 Jan 2020 13:17:44 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,413,1571695200"; d="scan'208";a="430610150"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 13:17:44 +0100
Date: Thu, 9 Jan 2020 13:17:44 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
Message-ID: <alpine.DEB.2.21.2001091315560.10786@hadrien>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
 <alpine.DEB.2.21.2001091140380.10786@hadrien>
 <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
 <alpine.DEB.2.21.2001091304310.10786@hadrien>
 <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-695649286-1578572264=:10786"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 09 Jan 2020 13:17:47 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 09 Jan 2020 13:17:44 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Wen Yang <wenyang@linux.alibaba.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [v2] coccinelle: semantic patch to check for
 inappropriate do_div() calls
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-695649286-1578572264=:10786
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 9 Jan 2020, Markus Elfring wrote:

> >> Does the Coccinelle software ensure that a variable like “r.ul” contains
> >> really useful data even if the expected branch of the SmPL disjunction
> >> was occasionally not matched?
> >
> > The python code will only be executed if it does.
>
> The Python scripts will be executed if the SmPL rule “r” found something.
> I suggest to take a closer look at the involved data types for
> really safe case distinctions.
> Does the dependency management around the application of SmPL disjunctions
> need any further clarification?

I already clarified it.  The python code will only be executed if the
variables that it references have values.  The criterion is not just
whether the rule r was matched.

To see that this is the case, all or you have to do is try it.  Or read
the Coccinelle source code.

julia
--8323329-695649286-1578572264=:10786
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-695649286-1578572264=:10786--

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78E132CF0
	for <lists+cocci@lfdr.de>; Tue,  7 Jan 2020 18:25:27 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 007HPCpT001830;
	Tue, 7 Jan 2020 18:25:12 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 067D63784;
	Tue,  7 Jan 2020 18:25:12 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 31AEE3784
 for <cocci@systeme.lip6.fr>; Tue,  7 Jan 2020 18:25:10 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 007HP8hf024657
 for <cocci@systeme.lip6.fr>; Tue, 7 Jan 2020 18:25:08 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,406,1571695200"; d="scan'208";a="335054412"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 18:25:07 +0100
Date: Tue, 7 Jan 2020 18:25:07 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Wen Yang <wenyang@linux.alibaba.com>
In-Reply-To: <20200107170240.47207-1-wenyang@linux.alibaba.com>
Message-ID: <alpine.DEB.2.21.2001071823060.3004@hadrien>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 07 Jan 2020 18:25:12 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 07 Jan 2020 18:25:08 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] coccinelle: semantic patch to check for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> +@depends on context@
> +expression f;
> +long l;
> +unsigned long ul;
> +u64 ul64;
> +s64 sl64;
> +
> +@@
> +(
> +* do_div(f, l);
> +|
> +* do_div(f, ul);
> +|
> +* do_div(f, ul64);
> +|
> +* do_div(f, sl64);
> +)

This part is not really ideal.  For the reports, you filter for the
constants, but here you don't do anything.  You can put some python code
in the matching of the metavariables:

unsigned long ul : script:python() { whatever you want to check on ul };

Then it will only match if the condition is satisfied.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

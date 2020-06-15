Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E01F9C26
	for <lists+cocci@lfdr.de>; Mon, 15 Jun 2020 17:43:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05FFhAAK018792;
	Mon, 15 Jun 2020 17:43:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AE9E8781F;
	Mon, 15 Jun 2020 17:43:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id F2D8F402B
 for <cocci@systeme.lip6.fr>; Mon, 15 Jun 2020 17:43:08 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05FFh71s016808
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 15 Jun 2020 17:43:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,515,1583190000"; d="scan'208";a="351660878"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 17:43:06 +0200
Date: Mon, 15 Jun 2020 17:43:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
Message-ID: <alpine.DEB.2.22.394.2006151742090.23306@hadrien>
References: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-34029661-1592235787=:23306"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 15 Jun 2020 17:43:12 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 15 Jun 2020 17:43:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] coccinelle: api: add device_attr_show script
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

--8323329-34029661-1592235787=:23306
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 15 Jun 2020, Markus Elfring wrote:

> > +// Confidence: High
>
> Would you like to add any suggestion for a possible patch message?
>
>
> …
> > +virtual report
> > +virtual org
> > +virtual context
> > +virtual patch
>
> +virtual report, org, context, patch
>
> Is such a SmPL code variant more succinct?

This doens't matter.

>
>
> …
> > +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	<...
> > +*	return snprintf@p(...);
> > +	...>
> > +}
>
> I suggest to reconsider the selection of the SmPL nest construct.
> https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L783
>
> Can the construct “<+... … ...+>” become relevant here?

<... ...> is fine if the only thing that will be used afterwards is what
is inside the <... ...>

julia

>
>
> Would you like to consider any further software design consequences
> around the safe application of the asterisk functionality in rules
> for the semantic patch language?
>
> Regards,
> Markus
>
--8323329-34029661-1592235787=:23306
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-34029661-1592235787=:23306--

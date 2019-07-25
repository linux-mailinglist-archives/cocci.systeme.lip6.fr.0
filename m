Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C195C74D29
	for <lists+cocci@lfdr.de>; Thu, 25 Jul 2019 13:35:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6PBYkNN028906;
	Thu, 25 Jul 2019 13:34:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5DB4F778D;
	Thu, 25 Jul 2019 13:34:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DB75176BF
 for <cocci@systeme.lip6.fr>; Thu, 25 Jul 2019 13:34:43 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6PBYhTM016235
 for <cocci@systeme.lip6.fr>; Thu, 25 Jul 2019 13:34:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,306,1559512800"; d="scan'208";a="314683334"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 13:34:40 +0200
Date: Thu, 25 Jul 2019 06:34:38 -0500 (CDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e3a37d93-0353-ebed-948a-991add184616@web.de>
Message-ID: <alpine.DEB.2.21.1907250632500.2535@hadrien>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <e3a37d93-0353-ebed-948a-991add184616@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2088688034-1564054482=:2535"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jul 2019 13:34:47 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 25 Jul 2019 13:34:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>,
        kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH 1/2] string: Add stracpy and stracpy_pad
	mechanisms
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

--8323329-2088688034-1564054482=:2535
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 25 Jul 2019, Markus Elfring wrote:

> > New version.  I check for non-use of the return value of strlcpy and
> > address some issues that affected the matching of the case where the first
> > argument involves a pointer dereference.
>
> I suggest to take another look at corresponding implementation details
> of the shown SmPL script.
>
>
> > \(strscpy\|strlcpy\)(e1.f, e2, i2)@p
>
> Can the data access operator “->” (arrow) matter also here?

What did my email say about isomorphisms?

>
>
> > @@
> > identifier r.i1,r.i2;
> > type T;
> > @@
> > struct i1 { ... T i1[i2]; ... }
>
> Will an additional SmPL rule name be helpful for this part?

Yes, sorry, it would seem that that is necessary.  I will fix and resend
the results.

>
>
> > @@
> > (
> > -x = strlcpy
> > +stracpy
> >   (e1.f, e2
> > -    , i2
> >   )@p;
> >   ... when != x
> >
> > |
>
> I wonder about the deletion of the assignment target.
> Should the setting of such a variable be usually preserved?

If it is a local variable and never subsequently used, it doesn't seem
very useful.

julia
--8323329-2088688034-1564054482=:2535
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-2088688034-1564054482=:2535--

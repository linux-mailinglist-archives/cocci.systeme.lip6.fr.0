Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA38353C88
	for <lists+cocci@lfdr.de>; Mon,  5 Apr 2021 10:53:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 1358rGgn020369;
	Mon, 5 Apr 2021 10:53:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C361577EB;
	Mon,  5 Apr 2021 10:53:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8373B3C26
 for <cocci@systeme.lip6.fr>; Mon,  5 Apr 2021 10:53:14 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 1358rEaf003283
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 5 Apr 2021 10:53:14 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AYuGl/qo4V5+fmhZ4flRF5JsaV5oCeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxxZFgMkc2NUZPvfVry7phwiLN/AZ6DWBDho3?=
 =?us-ascii?q?ahK4tvhLGP/xTFOwnTstFQzr1hda8WMrDNJGN3h8r7/wW0euxIqOWvyryihuvV?=
 =?us-ascii?q?0h5WJz1CVqcI1WxENjo=3D?=
X-IronPort-AV: E=Sophos;i="5.81,306,1610406000"; d="scan'208";a="501574159"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 10:53:13 +0200
Date: Mon, 5 Apr 2021 10:53:13 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <771c012f-bc1f-d330-6209-72130e199ae2@web.de>
Message-ID: <alpine.DEB.2.22.394.2104051052590.2981@hadrien>
References: <0756b630-a2d7-f300-3b11-59af33b48631@web.de>
 <alpine.DEB.2.22.394.2103281128560.2854@hadrien>
 <1b5f6d22-5b89-097f-37bd-13b3b2ab011a@web.de>
 <alpine.DEB.2.22.394.2103281244200.2854@hadrien>
 <173fa182-4127-aaba-262e-e3953a81a1e2@web.de>
 <alpine.DEB.2.22.394.2103281343310.2854@hadrien>
 <f720b262-708f-a603-3470-b374db625578@web.de>
 <alpine.DEB.2.22.394.2103281644480.2854@hadrien>
 <fa66fce2-e60e-1907-7c8b-fd9ceedb8086@web.de>
 <alpine.DEB.2.22.394.2104041357060.2958@hadrien>
 <addb2edb-98cb-2834-b1b9-7d44cacda965@web.de>
 <alpine.DEB.2.22.394.2104041419290.2958@hadrien>
 <b9f6aceb-7e68-303d-bd1e-d41a7992b58b@web.de>
 <alpine.DEB.2.22.394.2104050907270.2981@hadrien>
 <8561006e-7dc6-0f62-ecf0-c93146976925@web.de>
 <alpine.DEB.2.22.394.2104050953290.2981@hadrien>
 <771c012f-bc1f-d330-6209-72130e199ae2@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1610128445-1617612794=:2981"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 05 Apr 2021 10:53:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 05 Apr 2021 10:53:14 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking support for compound expressions (according to
 #define directives)
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

--8323329-1610128445-1617612794=:2981
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 5 Apr 2021, Markus Elfring wrote:

> >> I would like to avoid the repetition of parsing efforts as much as possible.
> >> Under which circumstances can replacement lists be taken better into account?
> >
> > Why does my suggestion involve a repetition of parsing effort?
>
> The selection of the applied programming interfaces has got significant influences
> on the run time behaviour.
>
> See also:
> https://github.com/coccinelle/coccinelle/issues/200#issuecomment-653775288
>
>
> > You want to use a regexp.
>
> This view depends on some factors.
> I would prefer to search for string literals (and their exclusion) by higher level means.
>
>
> > I'm asking you to put the regexp in a python function.
>
> How do you think about to improve the following software situation
> besides the application of regular expressions?
>
> @initialize:python@
> @@
> import re
>
> @display@
> identifier i =~ "^(?:[A-Z]+_){3,3}[A-Z]+";
> expression e : script:python() { re.match('"', e) };
> @@
> *#define i e
>
>
> elfring@Sonne:~/Projekte/PipeWire/lokal> spatch ~/Projekte/Coccinelle/janitor/show_define_usage7.cocci spa/include/spa/node/type-info.h
> …
>   File "<string>", line 5
>     coccinelle.result = (re . match ( " , e ))
>                                              ^
> SyntaxError: EOL while scanning string literal

This looks like a problem.  Thanks for the report.

julia
--8323329-1610128445-1617612794=:2981
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1610128445-1617612794=:2981--

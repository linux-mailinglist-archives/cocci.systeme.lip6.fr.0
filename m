Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38A6A704
	for <lists+cocci@lfdr.de>; Tue, 16 Jul 2019 13:10:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6GB9B6Y015504;
	Tue, 16 Jul 2019 13:09:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D50B97790;
	Tue, 16 Jul 2019 13:09:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CBEA0777F
 for <cocci@systeme.lip6.fr>; Tue, 16 Jul 2019 13:09:08 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6GB97BX023845
 for <cocci@systeme.lip6.fr>; Tue, 16 Jul 2019 13:09:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,498,1557180000"; d="scan'208";a="391992841"
Received: from unknown (HELO [10.100.127.113]) ([213.174.99.147])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 13:08:47 +0200
Date: Tue, 16 Jul 2019 13:08:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <663d8141-5740-a452-1f4a-8335203e65ba@web.de>
Message-ID: <alpine.DEB.2.21.1907161307550.2885@hadrien>
References: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
 <663d8141-5740-a452-1f4a-8335203e65ba@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-195811374-1563275328=:2885"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 16 Jul 2019 13:09:13 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 16 Jul 2019 13:09:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr,
        Wen Yang <yellowriver2010@hotmail.com>,
        Xue Zhihong <xue.zhihong@zte.com.cn>,
        Cheng Shengyu <cheng.shengyu@zte.com.cn>,
        Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [Cocci] [PATCH v3] coccinelle: semantic code search for missing
 of_node_put
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

--8323329-195811374-1563275328=:2885
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 16 Jul 2019, Markus Elfring wrote:

> > We find these functions by using the following script:
>
> Why would you like to keep this SmPL code in the commit description?

I don't know indetail what you are proposing, but I would prefer not to
put semantic patches that involve iteration into the kernel, for
simplicity.

julia


>
> I would prefer software evolution in an other direction.
> https://lore.kernel.org/lkml/44be5924-26ca-5106-aa25-3cbc3343aa2c@web.de/
> https://lkml.org/lkml/2019/7/4/21
>
>
> > @initialize:ocaml@
> > @@
> >
> > let relevant_str = "use of_node_put() on it when done"
>
> I see further possibilities to improve this data processing approach.
> https://lore.kernel.org/lkml/904b9362-cd01-ffc9-600b-0c48848617a0@web.de/
> https://lore.kernel.org/patchwork/patch/1095169/#1291378
> https://lkml.org/lkml/2019/6/28/326
>
>
> I am missing more constructive answers for mentioned development concerns.
>
>
> > And this patch also looks for places …
>
> Does a SmPL script perform an action?
>
>
> > Finally, this patch finds use-after-free issues for a node.
> > (implemented by the r_use_after_put rule)
>
> This software extension is another interesting contribution.
> But I imagine that a separate SmPL script can be more helpful for
> this source code search pattern.
>
>
> > v3: delete the global set, …
>
> To which previous implementation detail do you refer here?
>
>
> > +virtual report
> > +virtual org
> > +
> > +@initialize:python@
> > +@@
> > +
> > +report_miss_prefix = "ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line "
> > +report_miss_suffix = ", but without a corresponding object release within this function."
> > +org_miss_main = "acquired a node pointer with refcount incremented"
> > +org_miss_sec = "needed of_node_put"
> > +report_use_after_put = "ERROR: use-after-free; reference preceded by of_node_put on line "
> > +org_use_after_put_main = "of_node_put"
> > +org_use_after_put_sec = "reference"
>
> If you would insist on the usage of these variables, they should be applied
> only for the selected analysis operation mode.
> I would expect corresponding SmPL dependency specifications.
> https://github.com/coccinelle/coccinelle/blob/b4509f6e7fb06d5616bb19dd5a110b203fd0e566/docs/manual/cocci_syntax.tex#L559
>
>
> > +@r_miss_put exists@
> > +local idexpression struct device_node *x;
> > +expression e, e1;
> > +position p1, p2;
> > +statement S;
> > +type T, T1;
> > +@@
> > +
> > +* x = @p1\(of_find_all_nodes\|
>
> The usage of the SmPL asterisk functionality can fit to the operation mode “context”.
> https://bottest.wiki.kernel.org/coccicheck#modes
> Would you like to add any corresponding SmPL details?
>
> Under which circumstances will remaining programming concerns be clarified
> for such SmPL disjunctions?
>
>
> > +... when != e = (T)x
> > +    when != true x == NULL
>
> Will assignment exclusions get any more software development attention?
> https://lore.kernel.org/lkml/03cc4df5-ce7f-ba91-36b5-687fec8c7297@web.de/
> https://lore.kernel.org/patchwork/patch/1095169/#1291892
> https://lkml.org/lkml/2019/6/29/193
>
>
> > +    when != of_node_put(x)
> …
> > +)
> > +&
> > +x = f(...)
> > +...
> > +if (<+...x...+>) S
> > +...
> > +of_node_put(x);
> > +)
>
> You propose once more to use a SmPL conjunction in the rule “r_miss_put_ext”.
> I am also still waiting for a definitive explanation on the applicability
> of this combination.
>
>
> > +@r_put@
> > +expression E;
> > +position p1;
> > +@@
> > +
> > +* of_node_put@p1(E)
>
> I guess that this SmPL code will need further adjustments.
>
>
> > +@r_use_after_put exists@
> > +expression r_put.E, subE<=r_put.E;
>
> I have got an understanding difficulty around the interpretation
> of the shown SmPL constraint.
> How will the clarification be continued?
>
> Regards,
> Markus
>
--8323329-195811374-1563275328=:2885
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-195811374-1563275328=:2885--
